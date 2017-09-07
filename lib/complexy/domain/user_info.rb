module Complexy
  module Domain
  	class UserInfo < Struct.new(
  	  :id,
  	  :first_name,
  	  :last_name,
  	  :activities
  	)
    end
  end
end
