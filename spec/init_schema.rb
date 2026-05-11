# frozen_string_literal: true

current_dir = File.expand_path(__dir__)

config = YAML.safe_load_file(File.join(current_dir, 'database.yml'))
ActiveRecord::Base.establish_connection(config['test'])
load(File.join(current_dir, 'schema.rb'))
