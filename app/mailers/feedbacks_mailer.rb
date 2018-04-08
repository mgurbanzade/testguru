class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def send_message(feedback)
    @user = feedback.user
    @feedback = feedback

    mail to: @admin.email, from: @user.email, subject: @feedback.title
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
