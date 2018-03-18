class AddReferenceToDislike < ActiveRecord::Migration[5.2]
  def change
  	add_reference :dislikes, :user, foreign_key: true
  	add_reference :dislikes, :post, foreign_key: true
  end
end
