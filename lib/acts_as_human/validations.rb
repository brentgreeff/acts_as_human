module ActiveRecord
  module Validations
    module ClassMethods
	    
	    def validates_as_person_name(*attr_names)
	      config = {
	        :with => ActsAs::Human.acceptable_name,
          :message => ActsAs::Human.bad_name_message
	      }
	      check_format(attr_names, config)
	    end
			
			private
			
			def check_format(attr_names, config)
			  config.update(attr_names.pop) if attr_names.last.is_a?(Hash)
		    validates_format_of attr_names, config
			end
			
    end
  end
end
