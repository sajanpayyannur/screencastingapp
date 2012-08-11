class AdminContactMailer < ActionMailer::Base
  default from: "info@internetautoauctions.com"

  def contact(message)
    @message = message
    mail from: @message.from, subject: @message.subject, to: @message.to
  end
end
