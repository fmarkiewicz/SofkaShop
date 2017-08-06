class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = t('contact.message_send')
    else
      flash.now[:error] = t('contact.message_unsend')
      render :new
    end
  end
end
