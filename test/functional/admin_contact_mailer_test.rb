require 'test_helper'

class AdminContactMailerTest < ActionMailer::TestCase
  test "contact" do
    @message = FactoryGirl.create(:message, to: 'to@example.org', from: 'from@example.com', body: 'Hi', subject: 'Contact')

    mail = AdminContactMailer.contact @message
    assert_equal "Contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
