class Post < ApplicationRecord
	has_many :comments
	validates_presence_of :poster
	validates_presence_of :description
	validates_presence_of :picture
end
