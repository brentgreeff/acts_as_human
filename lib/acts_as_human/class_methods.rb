# frozen_string_literal: true

module ActsAs
  module Human
    module ClassMethods
      def acts_as_human(options = {})
        cattr_accessor :require_last_name
        self.require_last_name = options.fetch(:require_last_name, true)

        class_eval do
          validate_first_name
          validate_middle_names
          validate_last_name
        end
      end

      private

      def validate_first_name
        validates_presence_of :first_name, message: 'first name is required'
        validates_length_of :first_name, maximum: 40,
                                         message: 'first name is too long (max 40 characters)'
        validates_as_person_name :first_name
      end

      def validate_middle_names
        validates_length_of :middle_names, maximum: 40,
                                           allow_blank: true,
                                           message: 'middle names are too long (max 40 characters)'
        validates_as_person_name :middle_names, allow_nil: true
      end

      def validate_last_name
        validates_presence_of :last_name, if: -> { require_last_name },
                                          message: 'last name is required'
        validates_length_of :last_name, maximum: 40,
                                        allow_blank: true,
                                        message: 'last name is too long (max 40 characters)'
        validates_as_person_name :last_name
      end
    end
  end
end
