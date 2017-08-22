class MailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value !~ /\A(?!.*\.{2})([\w\.%\+\-]+)[\w\%\+\-]@([\w\-]+\.)+([\w]{2,})\z/i
      record.errors.add(attribute, options[:message])
    end
  end
end
