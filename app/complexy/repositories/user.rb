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

      def find_by_signature(first_name, last_name)
        user = Complexy::Storage::User.find_by_first_name_and_last_name(first_name, last_name)
        build_domain(user)
      end

      def update(id, first_name, last_name)
        Complexy::Storage::User.update(id, first_name: first_name, last_name: last_name)
      end

      private

      # TODO: move to some factory or else
      def build_domain(user_storage)
        Complexy::Domain::User.new(user_storage.id, user_storage.first_name, user_storage.last_name)
      end
    end
  end
end
