require 'sprout'

module AS3Signals
  NAME = "as3signals"
  VERSION = "0.7.0"
end

Sprout::Specification.new do |s|
   s.name    = AS3Signals::NAME
   s.version = AS3Signals::VERSION
   s.add_file_target do |t|
     t.platform = :universal
     t.add_library :src, "../src"
   end
end
