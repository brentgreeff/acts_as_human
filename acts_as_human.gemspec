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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
end
