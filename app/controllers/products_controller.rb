class ProductsController < ApplicationController

  def index
    @image = Product.order(created_at desc)
    @names = Product.order(:name desc)
    @costs = Product.order(:price desc)
    
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
