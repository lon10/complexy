namespace :db do
  task :seed do
  	10.times do |iteration|
      user = Complexy::Storage::User.create(
      	first_name: "First name #{iteration}",
      	last_name: "Last name #{iteration}"
      )
  	
      Complexy::Storage::UserActivity.create(
        user_id: user.id,
        action: Complexy::Storage::UserActivity::ACTIVITY_TYPES.sample,
        lat: 55,
        long: 44,
        created_at: Time.now
      )
    end
  end
end
