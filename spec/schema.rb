# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table :models, force: true do |t|
    t.string :first_name
    t.string :middle_names
    t.string :last_name
  end
end
