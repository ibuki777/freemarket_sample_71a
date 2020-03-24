class ProductsController < ApplicationController

  def index
    @products = Product.all
    @images = Image.all.order(created_at: :desc).limit(3)
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
