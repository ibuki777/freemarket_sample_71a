class ProductsController < ApplicationController

  def index
    @products = Product.includes(created_at: :desc)
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
