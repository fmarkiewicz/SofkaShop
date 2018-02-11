class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: [:hook]
  # GET /orders
  # GET /orders.json
  # def index
  #   @orders = Order.all
  # end

  # GET /orders/1
  # GET /orders/1.json

  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find params[:invoice]
      @order.update_attributes notification_params: params,
                               status: status,
                               transaction_id: params[:txn_id],
                               purchased_at: Time.now
    end
    # render nothing: true
  end

  def show
    unless params[:show_only] == 'true'
      if PayPal::SDK::REST::Payment.find(params[:paymentId]).execute(:payer_id => params[:PayerID])
        OrderMailer.order_confirmation_email(@order).deliver_now if @order.update(status: 'paid')
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  # def edit
  # end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    item = @order.product
    respond_to do |format|
    if @order.save
      # redirect_to @order.paypal_url(order_path(@order), )
      # format.html { redirect_to @order, notice: 'Order was successfully created.' }
      # format.json { render :show, status: :created, location: @order }
      @payment = PayPal::SDK::REST::Payment.new({
                                                    intent: 'sale',
                                                    payer: {payment_method: 'paypal'},
                                                    redirect_urls: {
                                                        return_url: order_url(@order),
                                                        cancel_url: root_url
                                                    },
                                                    transactions: {
                                                        item_list: {
                                                            items: [
                                                                {
                                                                    name: item.name,
                                                                    sku: item.name,
                                                                    price: format("%.2f", item.price_in_int/100),
                                                                    currency: 'PLN',
                                                                    quantity: 1
                                                                },
                                                                {
                                                                    name: "Przesyłka",
                                                                    sku: "shipment",
                                                                    price: format("%.2f", item.shipment_price_in_int/100),
                                                                    currency: 'PLN',
                                                                    quantity: 1
                                                                }

                                                            ]
                                                        },
                                                        amount: {
                                                            total: format("%.2f", (item.price_in_int + item.shipment_price_in_int)/100),
                                                            currency: 'PLN'
                                                        },
                                                        description: "Opłata za #{item.name} z przesyłką."
                                                    }
                                                })
      if @payment.create
        @redirect_url = @payment.links.find {|link| link.rel == 'approval_url'}.href
        session[:payment_id] = @payment.id
        redirect_to @redirect_url
      else
        logger.error @payment.error.inspect
        format.json {render json: {message: 'Błąd połaczenia. Spróbuj później!'}, status: :unprocessable_entity }
      end
    else
      render :new
      # format.html { render :new }
      # format.json { render json: @order.errors, status: :unprocessable_entity }
    end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1
  # DELETE /orders/1.json
  # def destroy
  #   @order.destroy
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:order_number, :status, :first_name, :last_name, :phone, :address, :city, :country,
                                  :nip, :company, :email, :zip_code, :total_price_in_int, :total_shipment_price_in_int,
                                  :payment_type, :comment, :product_id)
  end
end
