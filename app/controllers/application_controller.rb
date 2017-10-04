class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, only: [:new, :create, :edit, :destroy]

  def index
    render 'static_pages/home'
  end

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_url
    end  
  end   
end
