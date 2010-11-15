require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'test/unit'

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'

require 'active_record'

current_dir = File.expand_path(File.dirname(__FILE__))

ActiveRecord::Base.logger = Logger.new(File.join(current_dir, "debug.log"))
config = YAML::load(IO.read(File.join(current_dir, 'database.yml')))
ActiveRecord::Base.establish_connection(config['test'])

load(File.join(current_dir, "/schema.rb"))

$: << (File.join(current_dir, "..", "lib"))

begin
  require 'redgreen' unless ENV['TM_MODE']
rescue LoadError
end

require 'acts_as_human.rb'
