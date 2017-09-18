module Complexy
  module Repositories
  	class UserActivity
      def find_by_user_id(user_id)
        Complexy::Storage::UserActivity.where(:user_id => user_id).map do |activity_storage|
          build_domain(activity_storage)
        end
      end

      def all
        Complexy::Storage::UserActivity.all.map do |activity_storage|
          build_domain(activity_storage)
        end
      end

      private

      def build_domain(activity_storage)
        Complexy::Domain::UserActivity.new(activity_storage.user_id,
                                           activity_storage.action,
                                           activity_storage.lat,
                                           activity_storage.long,
                                           activity_storage.created_at
        )
      end
    end
  end
end
