class Api::V1::SessionSerializer < Api::V1::BaseSerializer
  
  attributes :id, :email, :username, :token

  def token
    object.authentication_token
  end
  
end