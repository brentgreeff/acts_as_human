ActiveRecord::Schema.define(:version => 20090628014113) do
  
  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_names"
    t.string   "last_name"
  end
  
end
