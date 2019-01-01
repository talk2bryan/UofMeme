class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :dislikes, dependent: :destroy
	attr_accessor :uploaded_image_for_io_adapters, :file_name, :top_text, :bot_text

	
	has_one_attached :image  
  
  validates :image, attached: true, content_type: ["image/jpeg", "image/png"]
  validates_presence_of :poster, :description
	validates :user, presence: true
	validates :user_id, presence: true
end



