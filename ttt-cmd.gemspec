# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ttt/cmd/version'

Gem::Specification.new do |spec|
  spec.name          = "ttt-cmd"
  spec.version       = Ttt::Cmd::VERSION
  spec.authors       = ["vanakenm"]
  spec.email         = ["martin.vanaken@8thcolor.com"]
  spec.summary       = %q{Command line for ttt.}
  spec.description   = %q{Can you beat the AI?}
  spec.homepage      = "https://github.com/vanakenm/ttt-cmd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = 'ttt'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
