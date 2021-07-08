class PasswordsController < ApplicationController
    before_action :set_user


    def forgot_password
        token = Token.new({user_id: @user.id})

        token.save

        PasswordMailer.with(user: @user, token: token).forgot.deliver_now!
    end 


    private

    def set_user
        @user = User.find_by(email: params[:email])
     end

end
