class Comment < ApplicationRecord
  belongs_to :post_id
  belongs_to :user_id
end
