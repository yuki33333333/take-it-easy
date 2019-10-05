class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path, success: 'Sign in に成功しました'
    else
      flash.now[:danger] = 'Sign inに失敗しました'
      render :new
    end
  end
  
  private
  def sign_in(user)
    session[:user_id] = user.id
  end
end
