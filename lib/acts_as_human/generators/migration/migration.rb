class AddNamesTo<%= table_name.capitalize %> < ActiveRecord::Migration[5.1]

  def change
    add_column :<%= table_name %>, :first_name, :string
    add_column :<%= table_name %>, :middle_names, :string
    add_column :<%= table_name %>, :last_name, :string
  end
end
