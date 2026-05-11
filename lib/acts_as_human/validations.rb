# frozen_string_literal: true

module ActsAs
  module Human
    mattr_accessor :acceptable_name, :bad_name_message

    self.acceptable_name = %r{\A[^[:cntrl:]\\<>/&]*\z}
    self.bad_name_message = 'some characters in your name are not allowed'
  end
end
