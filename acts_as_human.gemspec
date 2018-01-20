# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "acts_as_human/version"

Gem::Specification.new do |s|
  s.name = %q{acts_as_human}
  s.version = ActsAsHuman::VERSION
  s.authors = ["Brent"]
  s.email = ["brentgreeff@gmail.com"]

  s.summary = %q{Rails plugin to handle first_name, middle_names and last_name combinations.}
  s.homepage = %q{http://github.com/brentgreeff/acts_as_human}
  s.license = "MIT"

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "activesupport", "~> 5.1"
  s.add_development_dependency "activerecord", "~> 5.1"
  s.add_development_dependency "sqlite3"

  s.add_development_dependency "bundler", "~> 1.15"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
  s.add_development_dependency "awesome_print"
end
