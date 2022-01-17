class PasswordsController < ApplicationController

   # method called on forgot password route
   def forgot
    @user = User.find_by(email: params[:email])

    if @user.present?
      UserMailer.with(user: @user).password_reset.deliver_now
      render json:{success:"We have sent you an email with the steps to reset your password"}, status: 200
    else
      render json:{errors:"Email invalid"}
    end  
   end

  def reset
    @user = User.find_signed(params[:token], purpose: "password_reset")
    @user.password = params[:password]
    @user.save   
    if @user
      render json:{msg:"Credentials successfuly saved, please login with your new password"}, status: 200
    else  
      render json:{msg:"Something went wrong, please try again later or contact the admin"}, status: 404
    end     
  end

end
