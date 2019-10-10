class ApplicationController < ActionController::Base
  #common for all applications
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find(session[:user_id]) #||=は値がnillの時だけ右の値が代入される
  end

  def signed_in?
    !current_user.nil?
  end
end