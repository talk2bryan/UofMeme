class Like < ApplicationRecord
	validates  :username, presence: true
	validates  :postid, presence: true, numericality: { only_integer: true }
end
