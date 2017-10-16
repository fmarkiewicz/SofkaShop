class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def index
    render 'static_pages/home'
  end

end
