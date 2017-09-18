module Complexy
  module Repositories
  	class UserActivity
      def find_by_user_id(user_id)
        Complexy::Storage::UserActivity.where(user_id: user_id).map { |activity_storage| build_domain(activity_storage) }
      end

      def all
        Complexy::Storage::UserActivity.all.map { |activity_storage| build_domain(activity_storage) }
      end

      def create(user_id, activity)
        activity_storage = Complexy::Storage::UserActivity.create(from_domain(user_id, activity))

        build_domain(activity_storage)
      end

      def create_many(user_id, activities)
        Complexy::Storage::UserActivity.collection.insert_many(activities.map { |activity| from_domain(user_id, activity) } )
      end

      private

      def from_domain(user_id, activity)
        {
          user_id: user_id,
          action: activity.action,
          lat: activity.lat,
          long: activity.long,
          created_at: Time.now
        }
      end

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
