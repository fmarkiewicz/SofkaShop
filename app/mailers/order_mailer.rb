class OrderMailer < ApplicationMailer

  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: I18n.t('order_email.confirmation.subject'))
  end

  def change_order_status_email(order)
    @order = order
    mail(to: @order.email, subject: I18n.t('order_email.change_status.subject'))
  end

  def closed_order_email(order)
    @order = order
    mail(to: @order.email, subject: I18n.t('order_email.closed_order.subject'))
  end
end
