module ActsAsHuman

  module Generators

    class Migration < Thor::Group
      include Thor::Actions

      argument :table_name, type: :string

      def self.source_root
        File.dirname(__FILE__) + '/migration'
      end

      def copy_migration
        time = ActiveRecord::Migration.next_migration_number(1)
        file = "db/migrate/#{time}_add_names_to_#{table_name}.rb"
        template("migration.rb", file)
        puts 'Migration created'
      end
    end
  end
end
