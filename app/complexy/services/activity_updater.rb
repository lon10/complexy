module Complexy
  module Services
    class ActivityUpdater # Increments LAT and LONG at every user activity by first_name and last_name
      def initialize(first_name, last_name)
      	@user = Complexy::Repositories::User.new.find_by_signature(first_name, last_name)
      end

      # Without transactional continuity ¯\_(ツ)_/¯

      def increment_coords # Incrementing all user action's coordinates to 1
      	Complexy::Storage::UserActivity.where(user_id: @user.id).map do |activity|
      	  activity.update(lat: (activity.lat + 1), long: (activity.long + 1)) 
      	end
      end

      def rewrite_action(action) # Updating all user actions by 1 DB query
      	Complexy::Storage::UserActivity.where(user_id: @user.id).update_all(action: action)
      end
    end
  end
end
