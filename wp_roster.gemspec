# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wp_roster/version'

Gem::Specification.new do |s|
  s.name          = "wp_roster"
  s.version       = WpRoster::VERSION
  s.authors       = ["Deans Charbal"]
  s.summary       = %q{A gem for accessing current MLB rosters using Wikipedia template pages.}
  s.description   = s.summary
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "nokogiri",    "~>1.6.1"
  s.add_runtime_dependency "httparty",    "~>0.13.1"
  s.add_development_dependency "rspec",   "~>2.14.1"
  s.add_development_dependency "webmock", "~>1.17.4"
  s.add_development_dependency "vcr",     "~>2.9.0"
end
