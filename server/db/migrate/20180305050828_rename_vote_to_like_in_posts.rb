class RenameVoteToLikeInPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :vote, :like
  end
end
