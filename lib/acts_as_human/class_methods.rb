# frozen_string_literal: true

module ActsAs
  module Human
    module ClassMethods
      def acts_as_human(options = {})
        cattr_accessor :require_last_name
        self.require_last_name = options.fetch(:require_last_name, true)

        validate_first_name
        validate_middle_names
        validate_last_name
      end

      private

      def validate_first_name
        validates :first_name, presence: { message: 'first name is required' },
                               length: { maximum: 40, message: 'first name is too long (max 40 characters)' },
                               person_name: true
      end

      def validate_middle_names
        validates :middle_names, length: { maximum: 40, message: 'middle names are too long (max 40 characters)' },
                                 person_name: true,
                                 allow_nil: true
      end

      def validate_last_name
        validates :last_name, presence: { message: 'last name is required', if: -> { require_last_name } },
                              length: { maximum: 40, message: 'last name is too long (max 40 characters)' },
                              person_name: true
      end
    end
  end
end
