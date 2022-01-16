class UserMailer < ApplicationMailer
  # method to send email to user
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end
end
