module Complexy
  module Storage
    class UserActivity
      TABLE_NAME = 'complexy_storage_user_activities'

      ACTIVITY_TYPES = [
      	'milked a cow',
      	'Sawed wood',
      	'Wrote a program'
      ]

	  include Mongoid::Document

    field :user_id, type: Integer
    field :action, type: String
    field :lat, type: Float
    field :long, type: Float
    field :created_at, type: DateTime
    end
  end
end
