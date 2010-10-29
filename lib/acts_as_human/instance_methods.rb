module ActsAs
  module Human
    
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

