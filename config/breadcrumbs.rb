crumb :root do
  link "Home", root_path
end

crumb :userShow do
  link "【#{current_user.nickname}】のページ", user_path
  parent :root
end

crumb :userLogout do
  link "ログアウト", logout_user_path
  parent :userShow
end

crumb :cardIndex do
  link "登録カード", cards_path
  parent :userShow
end

crumb :userBought do
  link "購入した商品", bought_user_path
  parent :userShow
end

crumb :userSolded do
  link "販売した商品", solded_user_path
  parent :userShow
end

crumb :userAddress do
  link "発送元・お届け住所変更", edit_address_path
  parent :userShow
end

crumb :userMailPassword do
  link "登録情報編集", edit_user_registration_path
  parent :userShow
end

crumb :productShow do
  link "#{Product.find(params[:id]).name}" , product_path(params[:id])
  parent :root
end

crumb :search do
  link "【 #{params[:q][:name_cont]} 】 の検索結果", searches_path
  parent :root
end
