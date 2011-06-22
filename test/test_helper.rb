require 'rubygems'
require 'test/unit'
require 'active_model'
require 'mail_validator'
require 'ostruct'

class Person < OpenStruct
  include ActiveModel::Validations
  validates :email, :mail => true
end
