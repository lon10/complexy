module Complexy
  module Domain
  	class UserInfo < Struct.new(
  	  :id,
  	  :first_name,
  	  :last_name,
  	  :action,
  	  :lat,
  	  :long,
  	  :created_at
  	)
  end
end
