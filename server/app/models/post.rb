class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :dislikes, dependent: :destroy
	attr_accessor :uploaded_image_for_io_adapters, :file_name, :top_text, :bot_text

	
	has_attached_file :image, styles: {   
		original: "1920x1080>",
		thumb:  "100x100>",
		medium: "350x400!", 
		square: "200x200#",
		large:  "500x550!"
	}, default_url: "/images/:style/missing.png"
	:convert_options => {
    :medium => "-quality 100 -strip"} 
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	validates_attachment :image, presence: true
  	validates_presence_of :poster
	validates_presence_of :description
	validates :user, presence: true
	validates :user_id, presence: true
end



