module Complexy
  module Repositories
  	class UserInfo
      def find_by_user_id(user_id)
      	build_domain(user_repo.find(user_id), user_activity_repo.find_by_user_id(user_id))
      end

      private

      def user_repo
        @user_repo ||= Complexy::Repositories::User.new
      end

      def user_activity_repo
        @user_activity_repo ||= Complexy::Repositories::UserActivity.new
      end

      def find_user_activities(user_id)
        
      end

      def build_domain(user_storage, activity_storage)
        Complexy::Domain::UserInfo.new(user_storage.id,
                                       user_storage.first_name,
                                       user_storage.last_name,
                                       activity_storage
        )
      end
    end
  end
end
