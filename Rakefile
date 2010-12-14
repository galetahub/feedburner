require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'feedburner', 'version')

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the feedburner plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the feedburner plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Feedburner'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "feedburner"
    gemspec.version = FeedBurner::Version.dup
    gemspec.summary = "The FeedBurner Awareness API (AwAPI) allows publishers of FeedBurner feeds to reuse the detailed traffic statistics we capture for any of their feeds"
    gemspec.description = "The FeedBurner Awareness API (AwAPI) allows publishers of FeedBurner feeds to reuse the detailed traffic statistics we capture for any of their feeds. 
      Third-party applications and web services that consume feeds can leverage this data to provide useful feed awareness statistics to potential subscribers. 
      FeedBurner captures traffic data at an overall level for every feed. Feeds that use our free FeedBurner Stats PRO item view tracking have access to much more detailed data at the individual item level. 
      This data includes \"resyndication\" information, which is very useful for determining where and how a feed is being consumed."
    gemspec.email = "galeta.igor@gmail.com"
    gemspec.homepage = "http://code.google.com/apis/feedburner/awareness_api.html"
    gemspec.authors = ["Igor Galeta"]
    gemspec.files = FileList["[A-Z]*", "lib/**/*"]
    gemspec.rubyforge_project = "feedburner"
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
