class AddressesController < ApplicationController

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if current_user.id == @address.user.id && @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private


  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :city, :address, :building, :phone_number, :prefecture_id)
  end

end
