class MailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value !~ /^([\w\.!#\$%\-+.]+@[A-Za-z0-9\-]+(\.[A-Za-z0-9\-]+)+)$/
      record.errors.add(attribute, options[:message])
    end
  end
end
