class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  def index
    products = Product.includes(:images).where(exhibition_id: [1,2])
    @category =products.order(created_at: :desc).limit(3)
    @brand = Product.includes(params[:brand_id]).where(exhibition_id: [1,2],brand_id: [1..2]).order(created_at: :desc).limit(3)
    @images = Image.all.includes(:product)
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
    @comment = Comment.new
    # @comments = @product.comments.includes(:user)
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
      @product.images.new
      render action: :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @product.user.id && @product.destroy
      redirect_to root_path
    else
      redirect_to product_path(@product)
    end
  end

  private
  def product_params

    params.require(:product).permit(
                            :name, :explain, :price, 
                            :category_id, :brand_id, :condition_id, :deliveryday_id, :prefecture_id, :burden_id,
                            images_attributes:[:image, :_destroy, :id]
                             ).merge(
                              user_id: current_user.id, exhibition_id: 2
                              )

  end

  def set_product
    @product = Product.find(params[:id])
  end
end