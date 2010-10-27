Gem::Specification.new do |s|
  s.name = %q{acts_as_human}
  s.version = "2.0.0"
  
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brent Greeff"]
  s.date = %q{2010-10-27}
  s.description = %q{Rails plugin to handle first_name, middle_names and last_name combinations.}
  s.email = %q{email@brentgreeff.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/acts_as_human.rb",
    "lib/acts_as_human/validations.rb",
    "test/acts_as_human_test.rb",
    "test/database.yml",
    "test/schema.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/brentgreeff/acts_as_human}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Rails plugin to handle first_name, middle_names and last_name combinations.}
end
