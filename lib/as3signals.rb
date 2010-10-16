require 'sprout'
require File.join(File.dirname(__FILE__), "as3signals", "version")

module AS3Signals
end

Sprout::Specification.new do |s|
   s.name    = AS3Signals::NAME
   s.version = AS3Signals::VERSION
   s.add_file_target do |t|
     t.platform = :universal
     t.add_library :src, "../src"
   end
end
