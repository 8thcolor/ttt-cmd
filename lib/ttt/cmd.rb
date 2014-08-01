require "ttt/cmd/version"
require "rest-client"
require "json"

module Ttt
  module Cmd
    class Game
      UI = ['-', 'O', 'X']

      def to_ui(res)
        UI[res] + " "
      end

      def show_grid(parsed)
        puts "  0 1 2"
        (0..2).each do |y|
          print y.to_s + " " 
          (0..2).each do |x|
            print to_ui(parsed["grid"][x][y])
          end
          puts ""
        end
      end

      def start
        puts "Creating a new game"
        response = RestClient.post "http://0.0.0.0:3000/api_games", :content_type => :json, :accept => :json
        parsed = JSON.parse(response)
        id = parsed['id']
        puts "Game #{id} has stared."
        
        show_grid(parsed)

        puts "Your move? (use 'ttt -g #{id} -m X,Y' to play)."
        
      end

      def play(id, x, y)
        puts "Playing in game #{id} at (#{x},#{y})"
        response = RestClient.post "http://0.0.0.0:3000/api_games/#{id}/play", { 'x' => x, 'y' => y }.to_json, :content_type => :json, :accept => :json
        parsed = JSON.parse(response)

        show_grid(parsed)

        if(parsed['status'] == 'ongoing')
          puts "Your move? (use 'ttt -g #{id} -m X,Y' to play)."
        elsif (parsed['status'] == 'lost')
          puts "You lost! (use 'ttt --start to play again)."
        else
          puts "You won! (use 'ttt --start to play again)."
        end
      end
    end
  end
end
