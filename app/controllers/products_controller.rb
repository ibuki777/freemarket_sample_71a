class ProductsController < ApplicationController

  def index
    binding.pry
    @products = Product.order(created_at: :desc).limit(3)
    @images = Image.all.includes(:product)

  end

  def show
    
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
