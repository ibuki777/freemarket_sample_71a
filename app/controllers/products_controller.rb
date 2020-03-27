class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  
  def index
    @products = Product.includes(:images).order(created_at: :desc).limit(3)
    @images = Image.all.includes(:product)
  end

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to root_path
    else
    render :new
    end
  end

  def edit
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
