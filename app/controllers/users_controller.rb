class UsersController < ApplicationController
    # 中略
    def show
      @user = User.find(params[:id])
      @microposts = @user.microposts.page(params[:page]).per(10)
      @period = params[:period]
      @chart = @user.microposts_period(@period)
    
      @micropost = Micropost.new
      @micropost.user = current_user
    end

    def new
      @user = User.new
      
    end
  
    def create

      @user = User.new
      if @user.save
        flash[:success] = "Lantern Lanternの世界へようこそ"
        redirect_to @user
      else
        render 'new'
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = 'プロフィールの更新に成功しました'
        redirect_to @user
      else
        flash.now[:danger] = 'プロフィールの編集に失敗しました'
        redirect_to edit_user_path(@user)
      end
    end

    def destroy
      @user = User.find(params[:id])
      if params[:microposts][:reset_time] == '1'
        @user.microposts.destroy_all
        flash[:success] = '記録時間とメモをリセットしました'
        redirect_to edit_user_path(@user)
      end
    end



    
end