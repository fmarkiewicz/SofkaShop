require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { category_id: @product.category_id, description: @product.description, height: @product.height, in_magazine: @product.in_magazine, name: @product.name, only_on_demand: @product.only_on_demand, price_in_int: @product.price_in_int, shipment_price_in_int: @product.shipment_price_in_int, sleeping_area: @product.sleeping_area, width: @product.width } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { category_id: @product.category_id, description: @product.description, height: @product.height, in_magazine: @product.in_magazine, name: @product.name, only_on_demand: @product.only_on_demand, price_in_int: @product.price_in_int, shipment_price_in_int: @product.shipment_price_in_int, sleeping_area: @product.sleeping_area, width: @product.width } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
