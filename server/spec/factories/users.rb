FactoryBot.define do
  factory :user do
  	username { Faker::Lorem.characters(30)  }
  	email { '' + Faker::Lorem.characters(30) + '@myumanitoba.ca' }
  	password { '12345678' }
  	password_confirmation { '12345678' }
  end
end