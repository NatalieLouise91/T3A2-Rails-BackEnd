class PasswordsController < ApplicationController
   def forgot
    @user = User.find_by(email: params[:_json])
    if @user
      render json: {
        alert: "If this user exists, we have sent you a password reset email."
      }
      @user.send_password_reset
    else
      #this sends regardless of whether there's an email in database for security reasons
      render json: {
        alert: "If this user exists, we have sent you a password reset email."
      }
    end
  end

  def reset
    @user = User.find_by(reset_password_token: params[:token], email: params[:email])
    if @user.present? && user.password_token_valid?
      if @user.reset_password(params[:password])
        render json: {
          alert: "Your password has been successfuly reset!"
        }
        session[:user_id] = @user.id
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end

end
