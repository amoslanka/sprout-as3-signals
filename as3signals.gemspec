# -*- encoding: utf-8 -*-
require 'lib/as3signals'

Gem::Specification.new do |s|
  s.name        = AS3Signals::NAME
  s.version     = AS3Signals::VERSION
  # s.platform    = Gem::Platform::RUBY
  # s.authors     = ["TODO: Write your name"]
  s.email       = ["amoslanka@gmail.com"]
  s.homepage    = "http://www.github.com/amoslanka/sprout-as3-signals"
  s.summary     = %q{AS3-Signals ActionScript 3 source wrapped in a Sprout::Specification for implementation into a sprout project and Gem::Specification for distribution as a gem.}
  # s.description = %q{TODO: Write a gem description}

  # s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.files = FileList['lib/**/*.rb', 'bin/*', 'build/*', 'examples/**/*', 'src/**/*', '[A-Za-z0-9]*', 'tests/**/*'].to_a

  s.add_dependency 'sprout', '>= 1.0.26.pre'
  s.add_development_dependency 'asunit4'

end
