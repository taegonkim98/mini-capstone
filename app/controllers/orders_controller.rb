class OrdersController < ApplicationController
  before_action :authenticate_user
  def create
    product = Product.find_by(id: params[:product_id])
    calc_quantity = params[:quantity].to_i
    calc_subtotal = calc_quantity * product.price
    calc_tax = product.tax * calc_quantity
    calc_total = calc_subtotal + calc_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
    )
    order.save
    render json: order.as_json
  end

  def show
    if current_user
      the_id = params[:id]
      order = Order.find_by(id: the_id, user_id: current_user.id)
      render json: order
    else
      render json: { message: "Only current user can view order" }
    end
  end

  def index
    if current_user
      orders = Order.where(user_id: current_user.id)
      render json: orders.as_json
    else
      render json: [], status :unauthorized
    end
  end
end
