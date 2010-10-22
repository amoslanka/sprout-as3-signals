# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'as3signals/version'

Gem::Specification.new do |s|
  s.name        = AS3Signals::NAME
  s.version     = AS3Signals::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Robert Penner"]
  s.email       = ["info@robertpenner.com"]
  s.homepage    = "http://www.github.com/amoslanka/sprout-as3-signals"
  s.summary     = %q{AS3-Signals ActionScript 3 source wrapped in a Sprout::Specification for implementation into a sprout project and Gem::Specification for distribution as a gem.}
  s.description = %q{Signals is a new approach for AS3 events, inspired by C# events and signals/slots in Qt.}

  s.require_paths = ["lib"]
  
  s.files = Dir["{src,test,tests,asdoc,docs,doc,asdocs,lib,libs}/**/*", "bin/**/*.swc"]
  s.files << Dir["*.gemspec", "gemfile", "build*", "[A-Z]*[.a-z]*"]
  
  # s.files.reject! do |fn| 
  #   fn.include? "CVS"
  #   fn.include? ".svn"
  #   fn.include? ".git"
  #   fn.include? "*.gem"
  #   fn.include? "pkg"
  #   fn.include? "vendor"
  #   # fn.include? "**.cache"
  #   fn.include? ".cache"
  #   fn.include? ".as3proj"
  #   fn.include? ".docproj"
  # end
  
  # require 'pp'
  # pp s.files

  s.add_dependency 'flashsdk', '>= 1.0.0.pre'
  s.add_development_dependency 'asunit4'

end
