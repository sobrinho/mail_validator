class MailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value !~ /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
      message = options[:message].presence || :invalid
      record.errors.add(attribute, message)
    end
  end
end
