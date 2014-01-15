class PostNotification < ActionMailer::Base
  default from: "jimmymowschess@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_notification.comment_notification.subject
  #
  def comment_notification(user, commenter, post, comment)
    @user = user
    @commenter = commenter
    @post = post
    @comment = comment

    mail to: user.email, subject: "#{commenter.username} has commented on your post!"
  end
end
