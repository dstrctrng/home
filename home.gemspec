# -*- encoding: utf-8 -*-
#
$:.push File.expand_path("../lib", __FILE__)
require "home/version"

Gem::Specification.new do |s|
  s.name        = "home"
  s.version     = Home::Version.to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Nghiem", "Tom Bombadil"]
  s.email       = ["nghidav@gmail.com", "amanibhavam@destructuring.org"]
  s.homepage    = "https://github.com/destructuring/home"
  s.summary     = "gem to help setup your $HOME"
  s.description = "gem to help setup your $HOME"
  s.date        = %q{2013-01-27}
  s.executables   = [ ]
  s.require_paths = ["lib"]
  s.files = %w(LICENSE VERSION README.md) + Dir.glob("lib/**/*")
end
