class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  #
  # def record_not_found
  #   flash[:warning] = "Nie odnaleziono elementu"
  #   redirect_to controller: 'static_pages', action: 'render_500'
  # end


  def index
    render 'static_pages/home'
  end

end
