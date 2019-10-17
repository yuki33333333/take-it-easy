class UsersController < ApplicationController
  # Sign up 機能
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to todos_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  # アカウントページ機能
  def edit
    current_user
  end
  
  def update
    current_user
    if @current_user.update_attributes(user_params)
      redirect_to user_path, success: '更新が完了しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render 'show'
    end
  end
  
  def show
    current_user
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
