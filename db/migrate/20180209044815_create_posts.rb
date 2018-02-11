class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.column :poster, :text, :limit => 32, :null => true
    	t.column :vote, :integer, :default => 0	
    	t.column :description, :text
      t.timestamps
    end
  end
end
