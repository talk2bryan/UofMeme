class User < ApplicationRecord
	has_many :posts
	has_many :comments
	has_secure_password
	before_save { self.email = email.downcase }
	before_create :create_activation_digest

	validates :username, presence: true, length: {minimum: 3, maximum: 30 }, uniqueness: { case_sensitive: false }

	#validate valid email format and type
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@(myumanitoba|umanitoba)\.ca\z/i
	validates :email,  presence: true,length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX, message: ": Enter a valid uofm email address"}, uniqueness: { case_sensitive: false }
	
	validates :password,  presence: true, length: {minimum: 8}, confirmation: { case_sensitive: true }
	validates :password_confirmation,  presence: true, length: {minimum: 8}, confirmation: { case_sensitive: true }
	validates_uniqueness_of :username
	validates_uniqueness_of :email

	# Returns the hash digest of the given string.
  	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
 	end

	# Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	attr_accessor :remember_token, :activation_token
	#Remembers a logged in user
	def remember
    	self.remember_token = User.new_token
    	update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	# Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

	# Activate an account.
	def activate
		update_columns(activated: true, activated_at: Time.zone.now)
	end

	# Sends the activation email.
	def send_activation_email
		UserMailer.account_activation(self).deliver!
	end

end
