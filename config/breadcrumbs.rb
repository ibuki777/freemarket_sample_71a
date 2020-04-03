crumb :root do
  link "Home", root_path
end

crumb :mypage do |user|
  link "#{current_user.nickname}のページ", user_path
  parent :root
end

crumb :logout do |user|
  link "ログアウト", logout_user_path
  parent :mypage
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