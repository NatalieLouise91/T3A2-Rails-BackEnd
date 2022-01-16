class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false

    # method to create a user

    def create
        @user = User.create(user_params)
        @user.admin = false
        #Check if the user is saved, if not then show an error    
        if @user.save
            #Using JWT to send back necessary information
            auth_token = Knock::AuthToken.new(payload: {sub: @user.id})
            ### -- ERROR TypeConversion nil to string --
            render json: { email: @user.email, jwt: auth_token.token}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # method to sign in a user through knock authication

    def sign_in
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new(payload: {sub: @user.id})
            render json: { email: @user.email, jwt: auth_token.token }, status: 200
        else
            render json: {error: 'Invalid password'}, status: 404
        end
    end

    # method to retrieve all users and order them by name

    def index
        @users = User.order(first_name: :asc)
        render json: @users
    end 

    # method to show individual users

    def show
            @user = User.find(params[:id])
            render json: @user
    end

    private
    #create params to pass on user create method, this is Ruby's way
    def user_params
        params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone, :admin, :id)
    end

end