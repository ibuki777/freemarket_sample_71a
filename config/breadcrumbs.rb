crumb :root do
  link "Home", root_path
end

crumb :userShow do
  link "#{current_user.nickname}のページ", user_path
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


# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).