require 'sprout'
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'as3signals/version'

module AS3Signals
end

Sprout::Specification.new do |s|
   s.name    = AS3Signals::NAME
   s.version = AS3Signals::VERSION
   s.add_file_target do |t|
     t.platform = :universal
     t.add_library :src, "../src"
     t.add_library :swc, "../bin"
     t.add_library :docs, "../docs"
     t.add_library :all, "../"
   end
end
