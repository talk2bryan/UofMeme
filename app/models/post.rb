class Post < ApplicationRecord
	has_many :comments
	has_attached_file :image, styles: 
	{  
		thumb:  "100x100>",
		medium: "300x300>", 
		square: "200x200#",
		large:  "600x600>"
	}, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	validates_attachment :image, presence: true
  	validates_presence_of :poster
	validates_presence_of :description
end
