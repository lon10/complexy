module Complexy
  module Repositories
  	class User
      def all
      	Complexy::Storage::User.all.map do |user_storage|
      	  build_domain(user_storage)
      	end
      end

      def find(id)
      	build_domain(Complexy::Storage::User.find(id))
      end

      private

      def build_domain(user_storage)
        Complexy::Domain::User.new(user_storage.id, user_storage.first_name, user_storage.last_name)
      end
    end
  end
end
