class User < ApplicationRecord
	has_many :posts
	has_secure_password
	before_save { email.downcase! }

	validates :username, presence: true, length: {minimum: 3, maximum: 30 }, uniqueness: { case_sensitive: false }

	#validate valid email format and type
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@(myumanitoba|umanitoba)\.ca\z/i
	validates :email,  presence: true,length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX, message: ": Enter a valid uofm email address"}, uniqueness: { case_sensitive: false }
	
	validates :password,  presence: true, length: {minimum: 8}, confirmation: { case_sensitive: true }
	validates_uniqueness_of :username
	validates_uniqueness_of :email

end
