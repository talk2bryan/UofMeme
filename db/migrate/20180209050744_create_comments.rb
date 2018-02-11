class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.column :commenter, :text, :limit => 32, :null => true
    	t.column :description, :text
      t.timestamps
    end
  end

end
