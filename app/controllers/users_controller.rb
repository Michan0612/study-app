class UsersController < ApplicationController
    # 中略
    def show
      @user = User.find(params[:id])
      @microposts = @user.microposts.page(params[:page]).per(10)
    end
end