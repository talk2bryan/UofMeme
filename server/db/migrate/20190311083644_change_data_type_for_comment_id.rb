class ChangeDataTypeForCommentId < ActiveRecord::Migration[5.2]
  def change
      change_column :comments, :comment_id, :bigint
  end
end
