class UserMailer < ApplicationMailer

  default from: 'skemi_application@outlook.com'
  
  # method to send email to user
  # def password_reset(user, token)
  #   @token = token
  #   @user = user
    # @url = "https://skemi.netlify.app/reset_password/#{@token}"
  #   mail(
  #     from: "support@skemi.com", 
  #     to: @user.email, 
  #     subject: "Password Reset"
  #   )
  # end

  def password_reset
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
    @url = "https://skemi.netlify.app/reset_password"
    mail to: params[:user].email
    
  end 
end

