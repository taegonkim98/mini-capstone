class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end

  def create
    product = Product.new(
      # name: params[:input_name],
      # price: params[:input_price],
      # description: params[:input_description],
      # image_url: params[:input_image_url],
      name: "NAME", price: 50, description: "awlegbhluirehguiaer", image_url: "URL",
    )
    # product.save
    render json: product.as_json
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params[:input_name]
    product.description = params[:input_description]
    product.image_url = params[:input_image_url]
    product.price = params[:input_price]

    product.save
    render json: product.as_json
  end
end
