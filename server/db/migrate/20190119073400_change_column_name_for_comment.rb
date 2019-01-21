class ChangeColumnNameForComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :description, :body
    
    def self.up
      change_table :comments do |t|
        t.change :commenter, :string
      end
    end

    def self.down
      change_table :comments do |t|
        t.change :commenter, :text
      end
    end 
  end
end
