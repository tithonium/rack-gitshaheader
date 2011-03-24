# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/git-sha-header"

Gem::Specification.new do |s|
  s.name        = "rack-gitshaheader"
  s.version     = Rack::GitShaHeader::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Martin Tithonium"]
  s.email       = ["martian@midgard.org"]
  s.homepage    = ""
  s.summary     = %q{Tries to insert the current git revision in the headers}
  s.description = %q{A very bad idea}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
