class Post < ApplicationRecord
	has_many :comments
	validate_presence_of :poster
	validate_presence_of :description
	validate_presence_of :image
end
