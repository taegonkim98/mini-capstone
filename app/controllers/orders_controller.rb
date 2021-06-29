class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: price * quantity,
      tax: subtotal * 0.09,
      total: tax + subtotal,
    )
    order.save
    render json: order.as_json
  end

  def show
    if current_user
      the_id = params[:id]
      order = Order.find_by(id: the_id)
      render json: order
    else
      render json: { message: "Only current user can view order" }
    end
  end

  def index
    if current_user
      orders = Order.all
      render json: orders
    else
      render json: { message: "Only current user can view orders" }
    end
  end
end
