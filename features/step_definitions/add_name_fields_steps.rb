Then("the migration should contain the name fields") do
  file = Dir['tmp/aruba/db/migrate/*'].first.split('/').last

  steps %Q{
    Then the file "db/migrate/#{file}" should contain:
    """
    class AddNamesToVisitors < ActiveRecord::Migration[5.1]

      def change
        add_column :visitors, :first_name, :string
        add_column :visitors, :middle_names, :string
        add_column :visitors, :last_name, :string
      end
    end

    """
  }
end
