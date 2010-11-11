# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "job_listing_json_models/version"

Gem::Specification.new do |s|
  s.name        = "job_listing_json_models"
  s.version     = JobListingJsonModels::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr Chmolowski", "Peder Linder"]
  s.email       = ["pederbl@jobstar.se"]
#  s.homepage    = "http://rubygems.org/gems/job_listing_json_models"
#  s.summary     = %q{TODO: Write a gem summary}
#  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "job_listing_json_models"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
