class FeedbacksMailer < ApplicationMailer

  def send_feedback(feedback)
    @user = feedback[:user]
    @subject = feedback[:subject]
    @message = feedback[:message]

    mail to: ENV['ADMIN_EMAIL'], subject: "New message from #{@user.email} TestGuru user"
  end

  private

end
