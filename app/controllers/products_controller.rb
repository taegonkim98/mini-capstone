class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    category = params[:category]

    products = Product.all
    render json: products
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url],
      supplier_id: params[:supplier_id],
    )
    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: unprocessable_entity
    end
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params[:name] || product.name
    product.description = params[:description] || product.description
    product.image_url = params[:image_url] || product.image_url
    product.price = params[:price] || product.price
    product.supplier = params[:supplier] || product.supplier
    product.supplier_id = params[:supplier_id] || product.supplier_id

    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: unprocessable_entity
    end
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render json: product
  end
end
