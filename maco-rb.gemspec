# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "maco-rb/version"

Gem::Specification.new do |s|
  s.name        = "maco-rb"
  s.version     = MacoRb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sergio Arbeo"]
  s.email       = ["serabe@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Access usb devices from ruby.}
  s.description = %q{Access usb devices from Ruby. Written just in Ruby}

  s.rubyforge_project = "maco-rb"

  s.add_development_dependency 'mocha'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
