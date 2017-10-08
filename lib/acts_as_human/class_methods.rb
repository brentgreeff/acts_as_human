module ActsAs
  module Human
    mattr_accessor :acceptable_name, :bad_name_message

    self.acceptable_name = /\A[^[:cntrl:]\\<>\/&]*\z/
    self.bad_name_message = "some characters in your name are not allowed".freeze

    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods

      def acts_as_human(options={})
        cattr_accessor :require_last_name

        if options.has_key? :require_last_name
          @require_last_name = options[:require_last_name]
        else
          @require_last_name = true
        end
        send :include, InstanceMethods

        class_eval do
          validates_presence_of :first_name, message: 'first name is required'
          validates_length_of :first_name, maximum: 40,
            message: 'first name is too long (max 40 characters)'

          validates_as_person_name :first_name

          validates_length_of :middle_names, maximum: 40,
            allow_blank: true,
            message: 'middle names are too long (max 40 characters)'

          validates_as_person_name :middle_names, allow_nil: true

          validates_presence_of :last_name, if: Proc.new { @require_last_name },
            message: 'last name is required'

          validates_length_of :last_name, maximum: 40,
            allow_blank: true,
            message: 'last name is too long (max 40 characters)'

          validates_as_person_name :last_name
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActsAs::Human)
