class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  
  def index
    products = Product.includes(:images).limit(3)
    @category =products.order(created_at: :desc)
    @brand =products.order(brand_id: :desc)
    @images = Image.all.includes(:product)
    
  end

  def show
  end

  def new
    # params.require(:order).permit(:exhibiting).merge(exhibiting_id:1)
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    # @product.insert(exhibiting_id:1)
    if @product.save
        # def done 
        # @product= Product.find(params[:id])
        # end
      redirect_to root_path
    else
      render action: :new
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
    params.require(:product).permit(:name, :explain, :price, :category_id, :brand_id, :condition_id, :deliveryday_id, :prefecture_id, :burden_id, images_attributes:[:image]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end