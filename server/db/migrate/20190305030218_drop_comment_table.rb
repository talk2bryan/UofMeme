class DropCommentTable < ActiveRecord::Migration[5.2]
  def change
  drop_table(:comments)
  end
  def change
  remove_column :comments, :comment_id, :integer
  remove_column :comments, :postid, :integer
  remove_column :comments, :user_id, :string
  remove_column :comments, :commenter, :string
  remove_column :comments, :description, :string
  remove_column :comments, :created_at, :integer
  end
end
