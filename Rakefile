require 'bundler'
Bundler.require
require 'rake/clean'

CLOBBER.add('pkg')
# require 'lib/as3signals'
# Bundler::GemHelper.install_tasks

filename = "#{AS3Signals::NAME}-#{AS3Signals::VERSION}"

namespace :gem do
  directory "pkg"
  
  desc 'Build the gem'
  task :build => 'pkg' do
    system "gem build #{AS3Signals::NAME}.gemspec"
    system "mv #{filename}.gem pkg/#{filename}.gem"
  end

  desc "Build and install #{filename}.gem"
  task :install => :build do
    system "gem install pkg/#{filename}"
  end

  desc "Build and release #{filename}.gem to rubygems.org"
  task :release => :build do
    system "gem push #{filename}"
  end
end



# testing disabled for now. do actual as3 testing in the origin

# library :asunit4
# 
# asunit_home = ENV['ASUNIT_HOME'] || File.dirname(__FILE__) + '/../AsUnit-bacc/asunit-4.0'
# 
# def apply_as3_meta_data_args(t)
#   [
#     "After",
#     "AfterClass",
#     "Before",
#     "BeforeClass",
#     "Ignore",
#     "Inject",
#     "RunWith",
#     "Suite",
#     "Test"
#   ].each do |arg|
#     t.keep_as3_metadata << arg
#   end
# end
# 
# mxmlc "bin/AS3SignalsRunner.swf" do |t|
#   t.default_size = '1000 500'
#   t.input = 'tests/org/osflash/signals/AllTestsRunner.as'
#   #t.allow_source_path_overlap = true
#   t.source_path << 'src'
#   t.source_path << 'tests'
#   t.library_path << 'libs/asunit4-alpha.swc'
#   t.gem_version = '3.3.1'
# end
# 
# mxmlc "bin/AS3SignalsAsUnitRunner.swf" do |t|
#   t.default_size = '1000 500'
#   t.input = 'tests/org/osflash/signals/AllTestsRunner.as'
#   t.source_path << 'src'
#   t.library_path << "#{asunit_home}/lib/Reflection.swc"
#   t.source_path << "#{asunit_home}/src"
#   t.gem_version = '3.3.1'
#   apply_as3_meta_data_args(t)
# end
# 
# desc "Run the Test Harness"
# flashplayer :test => 'bin/AS3SignalsRunner.swf'
# 
# desc "Run the Test Harness against AsUnit source"
# flashplayer :test_asunit => 'bin/AS3SignalsAsUnitRunner.swf'
# 
