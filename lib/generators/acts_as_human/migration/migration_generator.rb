# frozen_string_literal: true

module ActsAsHuman
  module Generators
    class MigrationGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      desc 'Generates a migration to add first_name, middle_names, and last_name to a table.'

      def create_migration
        timestamp = Time.now.utc.strftime('%Y%m%d%H%M%S')
        template 'migration.rb', "db/migrate/#{timestamp}_add_names_to_#{file_name}.rb"
      end
    end
  end
end
