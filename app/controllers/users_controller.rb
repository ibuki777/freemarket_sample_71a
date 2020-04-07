class UsersController < ApplicationController
  before_action :only_signed_in_user

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
      redirect_to new_user_registration_path
    end
  end

end
