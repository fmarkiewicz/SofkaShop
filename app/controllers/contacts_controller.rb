class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = I18n.t('simple_form.contact.send')
    else
      flash.now[:danger] = I18n.t('simple_form.contact.unsend')
      render :new
    end
  end
end
