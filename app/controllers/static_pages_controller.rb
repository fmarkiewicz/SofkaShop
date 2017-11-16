class StaticPagesController < ApplicationController
  protect_from_forgery with: :exception

  def home
  end

  def contact_form
    respond_to do |format|
      format.json
    end
  end

  def render_500
    render '500'
  end
end
