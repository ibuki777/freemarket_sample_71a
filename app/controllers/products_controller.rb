class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  def index
    products = Product.includes(:images).limit(3)
    @category =products.order(created_at: :desc)
    @brand =products.order(brand_id: :desc)
    @images = Image.all.includes(:product)
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def new
    @product = Product.new
    @product.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @product = Product.new(product_params)
    category_id_params
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    grandchild_category = @product.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    category_id_params
    if @product.update(product_params_update)
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

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  def product_params
    params.require(:product).permit(:name, :explain, :price, :brand_id, :condition_id, :deliveryday_id, :prefecture_id, :burden_id, :exhibiting, images_attributes:[:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def product_params_update
    params.require(:product).permit(:name, :explain, :price, :category_id, :brand_id, :condition_id, :deliveryday_id, :prefecture_id, :burden_id, :exhibiting, images_attributes:[:image, :_destroy, :id]).merge(user_id: current_user.id)
  end


  def set_product
    @product = Product.find(params[:id])
  end

  def category_id_params
    category = params.permit(:category_id)
    @product[:category_id] = category[:category_id]
  end

end