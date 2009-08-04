module ActsAs
  module Human
    mattr_accessor :acceptable_name, :bad_name_message, :require_last_name
    
    self.acceptable_name    = /\A[^[:cntrl:]\\<>\/&]*\z/
    self.bad_name_message   = "some characters in your name are not allowed".freeze
    
    def acts_as_human(options={})
      if options.has_key? :require_last_name
        self.require_last_name = options[:require_last_name]
      else
        self.require_last_name = true
      end
      extend ClassMethods
      include InstanceMethods
    end
    
    module ClassMethods
      
      def self.extended(base)
        base.class_eval do
          validates_presence_of       :first_name, :message => 'first name is required'
          validates_length_of         :first_name, :maximum => 40,
                                      :message => 'first name is too long (max 40 characters)'
          validates_as_person_name    :first_name
          
          validates_length_of         :middle_names, :maximum => 40,
                                      :allow_blank => true,
                                      :message => 'middle names are too long (max 40 characters)'
          validates_as_person_name    :middle_names, :allow_nil => true
          
          validates_presence_of       :last_name, :if => Proc.new {ActsAs::Human.require_last_name},
                                      :message => 'last name is required'
          validates_length_of         :last_name, :maximum => 40,
                                      :allow_blank => true,
                                      :message => 'last name is too long (max 40 characters)'
          validates_as_person_name    :last_name
        end
      end
    end
    
    module InstanceMethods
      def full_name
        return '' if first_name.blank? and last_name.blank?
    
        return "#{first_name} #{last_name}" if middle_names.blank?
        return "#{first_name} #{middle_names} #{last_name}"
      end
      
      def full_name=(names)
        names_array = names.titlecase.split
    
        self.first_name = names_array.first
        return if names_array.size < 2
    
        self.last_name = names_array.last
    
        assign_middle_names(names_array)
      end
      
      private
      
      def assign_middle_names(names_array)
        if names_array.size > 2
          self.middle_names = get_middle_names(names_array)
        else
          self.middle_names = nil
        end
      end
      
      def get_middle_names(names_array)
        names_array[1..(names_array.size-2)].join(' ')
      end
    end
  end
end
