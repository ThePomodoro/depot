require 'test_helper'
class CartTest < ActiveSupport::TestCase

  test "cart line item should save price" do
    cart = carts(:one)
    [:ruby, :two, :ruby].each do |which_product|
      product = products(which_product)
      item = cart.add_product product.id, product.price
      assert_equal item.price, product.price,
        "cart line item did not save price" 
    	end
	end
	
  test "cart line item quantity should increment" do
    cart = carts(:two)
    product = products(:ruby)
    multiple = 3
	multiple.times { cart.add_product product.id, product.price }
    assert_equal multiple, cart.line_items.size
      "cart line item quantity is incorrect" 
  end

end

=begin 
  test "cart line item quantity should increment" do
  	cart = carts(:two)
  	product = products(:ruby)
  	multiple = 3
  	multiple.times {cart.add_product product.id, product.price}
  	item = cart.line_items.find_by_product_id product.id
  	assert_equal multiple, item.quantity, "Item count is incorrect"
  end
  

  fixtures :products

	def new_cart
		testcart = Cart.create
		testcart
	end

	test "valid cart" do
		assert new_cart.valid? "Cart should be created"
		product=products(:ruby)
		assert product.id = 1
		item = Cart.create.add_product product.id, product.price
		assert item.title = "Programming Ruby 1.9"
			
	end

   
	test "new cart with one product saves" do
		
		testproduct = products(:ruby)
		testcart.add_product(products(:ruby).id, products(:ruby).price)
		assert testcart.line_items.size = 1
		assert testcart.total_price = 49.50
	end
=end

