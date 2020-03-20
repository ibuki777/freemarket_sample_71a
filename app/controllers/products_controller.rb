class ProductsController < ApplicationController

  def index
    @products = Product.order(created_at: :desc)

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
