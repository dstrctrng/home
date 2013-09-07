# -*- encoding: utf-8 -*-
#
$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "home"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Nghiem", "Tom Bombadil"]
  s.email       = ["nghidav@gmail.com", "amanibhavam@destructuring.org"]
  s.homepage    = "https://github.com/destructuring/home"
  s.summary     = %q{encrypt plaintext using gpg}
  s.description = %q{encrypt plaintext using gpg}
  s.date        = %q{2013-07-04}
  s.executables   = [ ]
  s.require_paths = [ "lib" ]
  s.files = Dir.glob("exec/**/*") + Dir.glob("lib/**/*")
end
