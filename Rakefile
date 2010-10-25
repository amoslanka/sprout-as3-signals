require 'bundler'
Bundler.require
require 'rake/clean'

# the filename used by the gem
filename = "#{AS3Signals::NAME}-#{AS3Signals::VERSION}"
# the swc file as named by the ant tasks
swc = "bin/as3-signals-v0.7.swc"
# the dir of the docs, as compiled by the ant tasks
docs = "docs"

# Clean task will remove the files created by ant tasks
CLEAN.add(docs)
CLEAN.add(swc)
CLOBBER.add('pkg')
CLOBBER.add('vendor')
CLOBBER.add('.bundle')

# 
# Tasks
# 

desc 'Compile the swc and docs using the provided ant tasks.'
task :compile do
  
  puts "** Compiling swc and asdoc using provided ant tasks."
  puts `ant swc -DFLEX_HOME=/Developer/SDKs/Adobe_Flex/flex_sdk_4/`
  puts `ant asdoc -DFLEX_HOME=/Developer/SDKs/Adobe_Flex/flex_sdk_4/`
  
end

# 
# Test compile tasks
# 

library :asunit4
asunit_home = ENV['ASUNIT_HOME'] || File.dirname(__FILE__) + '/../AsUnit-bacc/asunit-4.0'

def apply_as3_meta_data_args(t)
  [
    "After",
    "AfterClass",
    "Before",
    "BeforeClass",
    "Ignore",
    "Inject",
    "RunWith",
    "Suite",
    "Test"
  ].each do |arg|
    t.keep_as3_metadata << arg
  end
end

mxmlc "bin/AS3SignalsRunner.swf" do |t|
  t.default_size = '1000 500'
  t.input = 'tests/org/osflash/signals/AllTestsRunner.as'
  #t.allow_source_path_overlap = true
  t.source_path << 'src'
  t.source_path << 'tests'
  # t.library_path << 'libs/asunit4-alpha.swc'
  t.library_path << 'lib/asunit4/'
  # t.gem_version = '3.3.1'
end

desc "Run the Test Harness"
flashplayer :test => 'bin/AS3SignalsRunner.swf'

# 
# Gem tasks
# 

namespace :gem do
  directory "pkg"
  
  desc 'Build the gem'
  task :build => 'pkg' do
    
    # verify that the proper swc and asdoc will be included in the gem
    if !File.exists?(swc) || !File.directory?(docs)
      say = "** There are missing swcs, asdocs, or src code. The gem will not be built without these files being provided. To build, run rake task `compile`. **"
      fail say
    end

    puts "#{AS3Signals::NAME}"
    puts 'hello'
    puts `gem build #{AS3Signals::NAME}.gemspec`
    puts `mv #{filename}.gem pkg/#{filename}.gem`
  end

  desc "Build and install #{filename}.gem"
  task :install => :build do
    puts `gem install pkg/#{filename}`
  end

  desc "Build and push #{filename}.gem to rubygems.org"
  task :push => :build do
    system "gem push #{filename}"
  end
end
