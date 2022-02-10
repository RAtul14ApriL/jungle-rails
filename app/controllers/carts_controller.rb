class CartsController < ApplicationController

  def show
    @user = User.find_by_id(session[:user_id])
  end

  def add_item
    product_id = params[:product_id].to_s
    product = Product.find_by_id(params[:product_id])
    if product.quantity > 0
      modify_cart_delta(product_id, +1)
      current_quantity = product.quantity - 1
      product.update(quantity: current_quantity)
    end

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    product = Product.find_by_id(params[:product_id])
    current_quantity = product.quantity + 1
    product.update(quantity: current_quantity)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
