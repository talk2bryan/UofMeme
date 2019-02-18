include ActionDispatch::TestProcess

FactoryBot.define do
    factory :post do
    trait :with_image do
      before :create do |post|
        file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
        file = fixture_file_upload(file_path, 'image/jpg')
        post.image.attach(file)
      end
    end
    association :user
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
    uploaded_image_for_io_adapters { "This is it" }
    like { 0 }
    dislike { 0 }
  end
   factory :post_with_gif do
    trait :with_image do
      after :create do |post|
        file_path = Rails.root.join('app', 'assets', 'images', 'ruff.gif')
        post.image.attach(io: File.open(file_path), filename: 'ruff.gif',
        content_type: 'image/gif')
      end
    end
    association :user
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
    uploaded_image_for_io_adapters { "This is a GIF" }
    like { 1 }
    dislike { 0 }
  end 
end
