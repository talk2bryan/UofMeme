class RemoveColumnsFromDislikeAndLike < ActiveRecord::Migration[5.2]
  def change
	remove_column :likes, :username, :string
	remove_column :likes, :postid, :integer
	remove_column :dislikes, :username, :string
	remove_column :dislikes, :postid, :integer
  end
end
