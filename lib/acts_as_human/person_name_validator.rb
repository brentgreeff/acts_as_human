# frozen_string_literal: true

class PersonNameValidator < ActiveModel::EachValidator
  ACCEPTABLE = %r{\A[^[:cntrl:]\\<>/&]*\z}

  def validate_each(record, attribute, value)
    return if value.nil?

    record.errors.add(attribute, 'some characters in your name are not allowed') unless value.match?(ACCEPTABLE)
  end
end
