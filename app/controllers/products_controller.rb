class ProductsController < ApplicationController

  def index
    @products = Product.order(created_at: :desc).limit(1)
    @images = Image.all.includes(:product)

  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    if @product.save
      redirect_to new_product_path
    else
      render "new"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
