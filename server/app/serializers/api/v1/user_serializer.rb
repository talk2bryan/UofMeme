class Api::V1::UserSerializer < Api::V1::BaseSerializer

  attributes :id, :email, :password, :username, :remember_digest, :created_at, :updated_at


  #has_many :posts
 # has_many :comments
 # has_many :likes
 # has_many :dislikes
 # has_many :posts, through: :likes
 # has_many :posts, through: :dislikes

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end

end