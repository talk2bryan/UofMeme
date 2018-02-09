class CreatePosts < ActiveRecord::Migration[5.2]
  def self_up
    create_table :posts do |t|
    	t.column :poster, :text, :limit => 32, :null => false
    	t.column :vote, :integer, :default => 0	
    	t.column :picture, :binary, :null => false
    	t.column :description, :text
      t.timestamps
    end

    #Post.create :poster=> "Anonymous", :vote => 0, :picture => "", :description => "Just a meme"
  end

  def self_down
  	drop_table :posts
  end
end
