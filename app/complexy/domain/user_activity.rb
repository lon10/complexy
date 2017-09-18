module Complexy
  module Domain
  	class UserActivity < Struct.new(
  	  :user_id,
  	  :action,
  	  :lat,
  	  :long,
  	  :created_at
  	)
    end
  end
end
