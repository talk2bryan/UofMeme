class CreateComments < ActiveRecord::Migration[5.2]
  def self_up
    create_table :comments do |t|
    	t.column :commenter, :text, :limit => 32, :null => false
    	t.column :description, :text

      	t.timestamps
    end
  end

  def self_down
  	drop_table :comments
  end
end
