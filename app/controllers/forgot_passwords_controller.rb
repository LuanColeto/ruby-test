class ForgotPasswordsController < ApplicationController
    before_action :set_user
    before_action :set_token

    def reset_password
        if @token.user_id === @user.id
            @user.update_attribute(:password, params[:password])
        else
            render json: {message: 'Token inválido'}
        end
    end


    private

    def set_user
        token = Token.find_by(token: params[:token])

        if token
            @user = User.find_by(id: token.user_id)
        end
     end

     def set_token
        @token = Token.find_by(token: params[:token])

        if !@token 
            render json: {message: 'Token inválido'}
        end
    end

end
