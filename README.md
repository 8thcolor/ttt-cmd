TicTacToe - Command line
========================

Rails application allowing to play TicTacToe game against a (drunk) coAmputer.

Built as an show of different kinds of User Interfaces, as part as a talk given at [Paris.rb](https://speakerdeck.com/vanakenm/ive-an-idea-lets-do-a-webapp-or-not).

Requires the [web server](http://github.com/vanakenm/ttt-web) to be running locally.

# Build the gem

    rake install

# Usage

Launch your server (expected on localhost:3000). Then:

    ttt --start

to start a game.

    ttt -g <id> -m <x>,<y>

to play.