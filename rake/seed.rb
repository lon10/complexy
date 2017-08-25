namespace :db do
  task :seed do
  	# TODO: write this shit
    User.create
    UserActivity.create
  end
end
