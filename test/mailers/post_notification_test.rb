require 'test_helper'

class PostNotificationTest < ActionMailer::TestCase
  test "comment_notification" do
    mail = PostNotification.comment_notification
    assert_equal "Comment notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
