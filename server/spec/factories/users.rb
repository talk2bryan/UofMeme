FactoryBot.define do
  factory :user do
  	username { 'joe' }
  	email {'joe@myumanitoba.ca' }
  	password { '12345678' }
  	password_confirmation { '12345678' }
  end
end