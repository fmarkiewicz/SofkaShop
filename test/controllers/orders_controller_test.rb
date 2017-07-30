require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @order.address, city: @order.city, comment: @order.comment, company: @order.company, country: @order.country, email: @order.email, first_name: @order.first_name, last_name: @order.last_name, nip: @order.nip, order_number: @order.order_number, payment_type: @order.payment_type, phone: @order.phone, status: @order.status, total_price_in_int: @order.total_price_in_int, total_shipment_price_in_int: @order.total_shipment_price_in_int, zip_code: @order.zip_code } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, city: @order.city, comment: @order.comment, company: @order.company, country: @order.country, email: @order.email, first_name: @order.first_name, last_name: @order.last_name, nip: @order.nip, order_number: @order.order_number, payment_type: @order.payment_type, phone: @order.phone, status: @order.status, total_price_in_int: @order.total_price_in_int, total_shipment_price_in_int: @order.total_shipment_price_in_int, zip_code: @order.zip_code } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
