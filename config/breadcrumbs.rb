# frozen_string_literal: true

crumb :top do
  link 'トップページ', root_path
end

crumb :fighters do
  link 'データベース', fighters_path
  parent :top
end

crumb :fighter_new do
  link '登録', new_fighter_path
  parent :top
end

crumb :fighter_show do |fighter|
  link "#{fighter.name}の詳細", fighter_path(fighter)
  parent :fighters
end

crumb :contact_new do
  link 'お問い合わせ', new_contact_path
  parent :top
end

crumb :howto do
  link '使い方', page_path('howto')
  parent :top
end

crumb :fighter_edit do |fighter|
  link '編集', edit_fighter_path
  parent :fighter_show, fighter
end

crumb :user_new do
  link '会員登録', new_user_path
  parent :top
end

crumb :login do
  link 'ログインページ', login_path
  parent :top
end

crumb :profile do
  link 'プロフィール', profile_path
  parent :top
end

crumb :profile_edit do |_profile|
  link 'プロフィール編集', edit_profile_path
  parent :profile
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

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
