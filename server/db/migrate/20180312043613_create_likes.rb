class CreateLikes < ActiveRecord::Migration[5.2]
def change
create_table :likes do |t|
  t.string :username
  t.integer :postid
  t.timestamps
end
end
end
