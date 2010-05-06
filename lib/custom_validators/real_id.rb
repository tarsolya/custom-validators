# Real ID format validator for Blizzard's Battle.net 2.0
#
# === Usage
# 
#   validates :foo, :real_id => true
#
class RealIdValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value) #:nodoc:#
    record.errors[attribute] << (options[:message] || "is not a Real ID") unless
      value =~ /^([a-zA-Z]{3,})\.([a-z]{3,})$/i
  end
  
end