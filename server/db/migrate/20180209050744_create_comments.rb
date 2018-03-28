class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.column :commenter, :text, :limit => 32, :null => false
    	t.column :description, :text

    	t.references :post, foreign_key: true
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end

end
