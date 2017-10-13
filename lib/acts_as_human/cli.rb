require 'active_support'
require 'active_record'
require 'acts_as_human'
require 'thor'
require 'acts_as_human/generators/migration'

module ActsAsHuman

  class CLI < Thor

    desc "migration", "Generates migration to add name fields"
    def migration( table_name )
      Generators::Migration.start( [table_name] )
    end
  end
end
