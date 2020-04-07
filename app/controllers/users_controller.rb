class UsersController < ApplicationController
  before_action :only_signed_in_user
  before_action :set_address_id

  def show
    @sold_products=current_user.products.includes(:user)
  end

  def edit
  end

  def update
  end

  def logout
  end

  def bought
    @orders= Order.where(user: current_user)
  end

  def solded
    @products =Product.where(user: current_user)
  end


  private

  def only_signed_in_user
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_address_id
    @addresses = current_user.addresses[0].id
  end
end
