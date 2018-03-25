class Api::V1::LikeSerializer < Api::V1::BaseSerializer

	attributes :user_id, :post_id

 	has_one :user
 	has_one :post 

	def created_at
		object.created_at.in_time_zone.iso8601 if object.created_at
	end

	def updated_at
		object.updated_at.in_time_zone.iso8601 if object.created_at
	end

	class Api::V1::UserSerializer < Api::V1::BaseSerializer
		attributes :id
	end

	class Api::V1::PostSerializer < Api::V1::BaseSerializer
		attributes :id
	end

end