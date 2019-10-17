class SessionsController < ApplicationController
  # Sign in 機能
  def new
  end
  
  def create
    user = User.find_by(session_email_params)
    if user && user.authenticate(session_password_params[:password])
      sign_in(user)
      redirect_to todos_path, success: 'Sign in に成功しました'
    else
      flash.now[:danger] = 'Sign inに失敗しました'
      render :new
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url, info: 'Sign out しました'
  end
  
  private
  def session_email_params
    params.require(:session).permit(:email)
  end

  def session_password_params
    params.require(:session).permit(:password)
  end
  
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
