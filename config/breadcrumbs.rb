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
  link "登録カード一覧", cards_path
  parent :userShow
end
