# frozen_string_literal: true

require_relative 'lib/acts_as_human/version'

Gem::Specification.new do |spec|
  spec.name        = 'acts_as_human'
  spec.version     = ActsAsHuman::VERSION
  spec.authors     = ['Brent Greeff']
  spec.email       = ['brentgreeff@gmail.com']
  spec.summary     = 'Rails plugin to handle first_name, middle_names and last_name combinations.'
  spec.homepage    = 'https://github.com/brentgreeff/acts_as_human'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.3'

  spec.metadata = {
    'source_code_uri' => 'https://github.com/brentgreeff/acts_as_human',
    'rubygems_mfa_required' => 'true'
  }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:spec|test|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 7.0'
  spec.add_dependency 'railties', '>= 7.0'

  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'lefthook'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'sqlite3'
end
