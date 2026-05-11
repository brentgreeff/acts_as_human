class AddNamesTo<%= class_name %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def change
    add_column :<%= table_name %>, :first_name, :string
    add_column :<%= table_name %>, :middle_names, :string
    add_column :<%= table_name %>, :last_name, :string
  end
end
