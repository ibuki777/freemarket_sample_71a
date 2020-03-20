class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at)
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
