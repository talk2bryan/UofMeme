class AddDislikeToPosts < ActiveRecord::Migration[5.2]
  def change
  add_column :posts, :dislike, :integer, :default => 0
  end
end
