class Post < ApplicationRecord
	has_many :comments
	has_many :likes
	has_many :dislikes
	belongs_to :user
	
	has_attached_file :image, styles: 
	{   
		original: "1920x1080>",
		thumb:  "100x100>",
		medium: "350x400!", 
		square: "200x200#",
		large:  "500x550!"
	},  
	:convert_options => {
    :medium => "-quality 100 -strip"}, 
    default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	validates_attachment :image, presence: true
  	validates_presence_of :poster
	validates_presence_of :description
	validates :user, presence: true
	validates :user_id, presence: true

end



