class Dislike < ApplicationRecord
	validates  :username, presence: true, uniqueness: {scope: :postid}
	validates  :postid, presence: true, numericality: { only_integer: true }
end
