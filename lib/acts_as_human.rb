# frozen_string_literal: true

require 'acts_as_human/person_name_validator'
require 'acts_as_human/name_parser'
require 'acts_as_human/instance_methods'
require 'acts_as_human/class_methods'

ActiveSupport.on_load(:active_record) do
  include ActsAs::Human::InstanceMethods
  extend ActsAs::Human::ClassMethods
end
