# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{feedburner}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Igor Galeta"]
  s.date = %q{2010-12-14}
  s.description = %q{The FeedBurner Awareness API (AwAPI) allows publishers of FeedBurner feeds to reuse the detailed traffic statistics we capture for any of their feeds. 
      Third-party applications and web services that consume feeds can leverage this data to provide useful feed awareness statistics to potential subscribers. 
      FeedBurner captures traffic data at an overall level for every feed. Feeds that use our free FeedBurner Stats PRO item view tracking have access to much more detailed data at the individual item level. 
      This data includes "resyndication" information, which is very useful for determining where and how a feed is being consumed.}
  s.email = %q{galeta.igor@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "lib/feedburner.rb",
     "lib/feedburner/api.rb",
     "lib/feedburner/api/entry.rb",
     "lib/feedburner/api/feed.rb",
     "lib/feedburner/api/item.rb",
     "lib/feedburner/api/referer.rb",
     "lib/feedburner/version.rb"
  ]
  s.homepage = %q{http://code.google.com/apis/feedburner/awareness_api.html}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{feedburner}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The FeedBurner Awareness API (AwAPI) allows publishers of FeedBurner feeds to reuse the detailed traffic statistics we capture for any of their feeds}
  s.test_files = [
    "test/feedburner_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

