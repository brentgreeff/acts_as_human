# frozen_string_literal: true

module ActsAs
  module Human
    module InstanceMethods
      def full_name
        return '' if first_name.blank? && last_name.blank?
        return "#{first_name} #{last_name}" if middle_names.blank?

        "#{first_name} #{middle_names} #{last_name}"
      end

      def full_name=(value)
        parsed = NameParser.new(value)
        self.first_name = parsed.first_name
        self.last_name = parsed.last_name
        self.middle_names = parsed.middle_names
      end
    end
  end
end
