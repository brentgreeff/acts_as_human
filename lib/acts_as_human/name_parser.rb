# frozen_string_literal: true

module ActsAs
  module Human
    class NameParser
      attr_reader :first_name, :middle_names, :last_name

      def initialize(full_name)
        parts = full_name.titlecase.split
        @first_name   = parts.first
        @last_name    = extract_last_name(parts)
        @middle_names = extract_middle_names(parts)
      end

      private

      def extract_last_name(parts)
        return nil if parts.size < 2

        if parts.size > 2 && parts[-2] == 'Mc'
          "#{parts[-2]} #{parts[-1]}"
        else
          parts.last
        end
      end

      def extract_middle_names(parts)
        return nil if parts.size < 3

        upper = parts[-2] == 'Mc' ? -3 : -2
        parts[1..upper].join(' ')
      end
    end
  end
end
