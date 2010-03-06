require 'test_helper'

class ValidatesAsMailTest < ActiveSupport::TestCase
  class Person < ActiveRecord::Base
    validates :email, :mail => true
  end
  
  test "blank values" do
    ['', false, nil].each do |mail|
      assert Person.new(:email => mail).invalid?
    end
  end
  
  test "illegal addresses" do
    ['Max@Job 3:14', 'Job@Book of Job', "J. P. 's-Gravezande, a.k.a. The Hacker!@example.com"].each do |mail|
      assert_equal false, Person.new(:email => mail).valid?
    end
  end
  
  test "legal addresses" do
    ['test@example.com', 'test@example.co.uk', 'someone@123.com'].each do |mail|
      assert Person.new(:email => mail).valid?
    end
  end
end
