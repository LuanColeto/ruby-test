class PasswordMailer < ApplicationMailer
    def forgot
       @user = params[:user]
       @token = params[:token]
       mail to: @user.email, subject: "Forgot password"
     end
end
