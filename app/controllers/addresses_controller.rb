class AddressesController < ApplicationController
  before_action :set_address

  def edit
  end

  def update
    if current_user.id == @address.user.id && @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :city, :address, :building, :phone_number, :prefecture_id)
  end

end
