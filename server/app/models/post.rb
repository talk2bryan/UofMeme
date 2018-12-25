class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :dislikes, dependent: :destroy
	attr_accessor :uploaded_image_for_io_adapters, :file_name, :top_text, :bot_text

	
	has_attached_file :image  
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment :image, presence: true
  validates_presence_of :poster
	validates_presence_of :description
	validates :user, presence: true
	validates :user_id, presence: true
end



