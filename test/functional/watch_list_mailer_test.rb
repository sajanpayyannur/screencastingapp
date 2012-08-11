require 'test_helper'

class WatchListMailerTest < ActionMailer::TestCase
  test "notify_interaction" do
    mail = WatchListMailer.notify_interaction
    assert_equal "Notify interaction", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
