require 'test_helper'

class MailValidatorTest < Test::Unit::TestCase
  def test_illegal_addresses
    assert_invalid 'Max@Job 3:14'
    assert_invalid 'Job@Book of Job'
    assert_invalid "J. P. 's-Gravezande, a.k.a. The Hacker!@example.com"
  end

  def test_legal_addresses
    assert_valid 'test@example.com'
    assert_valid 'test@example.co.uk'
    assert_valid 'someone@123.com'
  end

  protected

  def assert_valid(email)
    assert person(:email => email).valid?
  end

  def assert_invalid(email)
    assert person(:email => email).invalid?
  end

  def person(attributes = {})
    Person.new(attributes)
  end
end
