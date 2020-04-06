class UsersController < ApplicationController
  before_action :only_signed_in_user

  def show
  end

  def edit
  end

  def update
  end

  def logout
  end

  private

  def only_signed_in_user
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
