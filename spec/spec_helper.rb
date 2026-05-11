# frozen_string_literal: true

require 'bundler/setup'
require 'active_support'
require 'active_record'
require 'init_schema'
require 'acts_as_human'

ActiveSupport.run_load_hooks(:active_record, ActiveRecord::Base)

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
