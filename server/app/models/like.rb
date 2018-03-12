class Like < ApplicationRecord
	validates  :username, presence: true
	validates  :postid, presence: true
end
