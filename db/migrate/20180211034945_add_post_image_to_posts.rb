class AddPostImageToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :posts, :image
  end
end
