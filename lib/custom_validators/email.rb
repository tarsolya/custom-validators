# Simple e-mail format validator
#
# === Usage
# 
#   validates :foo, :email => true
#
class EmailValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value) #:nodoc:#
    record.errors[attribute] << (options[:message] || "is not an email") unless
      value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
  
end