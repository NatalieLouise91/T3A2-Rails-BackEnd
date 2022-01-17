class UserMailer < ApplicationMailer

  default from: 'no-reply@example.com'

  # password reset mailer function

  def password_reset
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
    @url = "https://skemi.netlify.app/reset_password"
    mail to: params[:user].email
    
  end 
end

