module Complexy
  module Domain
  	class UserActivity < Struct.new(
  	  :user_id
  	  :lat,
  	  :long,
  	  :created_at
  	)
  end
end
