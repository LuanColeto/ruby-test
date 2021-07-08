class ProfileController < ApplicationController
    before_action :authorized

    def update_avatar
        @user.avatar.attach(params[:avatar])

        @user.save

        render json: {avatar: url_for(@user.avatar)}
    end
end
