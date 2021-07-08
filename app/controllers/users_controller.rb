class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    def create
        user_with_same_email = User.find_by(email: params[:email]);


        if user_with_same_email
            render json: {funciona: "E-mail already taken"}
        else
            @user = User.create(user_params)

            render json: @user
        end
    end

    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, avatar: url_for(@user.avatar), token: token}
        else
            render json: {error: "Invalid credentials"}
        end
    end

    def auto_login
        render json: @user
    end
    
    private

    def user_params
        params.permit(:email, :password, :name)
    end

end
