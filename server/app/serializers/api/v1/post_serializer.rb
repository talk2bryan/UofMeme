class Api::V1::PostSerializer < Api::V1::BaseSerializer

	attributes :poster, :description, :user_id, :file_name, :uploaded_image_for_io_adapters, :like, :dislike
	
 	has_one :user
 	has_many :likes
 	has_many :dislikes
  

	def created_at
		object.created_at.in_time_zone.iso8601 if object.created_at
	end

	def updated_at
		object.updated_at.in_time_zone.iso8601 if object.created_at
	end

	class Api::V1::UserSerializer < Api::V1::BaseSerializer
		attributes :id, :username
	end

end