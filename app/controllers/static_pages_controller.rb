class StaticPagesController < ApplicationController
  protect_from_forgery with: :exception

  def home
  end

  def contact

  end

  def contact_form
    respond_to do |format|
      format.json
    end
  end
end
