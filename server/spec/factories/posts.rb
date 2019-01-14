FactoryBot.define do
    factory :post do
    trait :with_image do
      after :build do |post|
        file_path = Rails.root.join('app', 'assets', 'images', 'mememan.jpg')
        post.image.attach(io: File.open(file_path), filename: 'mememan.jpg',
        content_type: 'image/jpg')
      end
    end
    association :user
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
    uploaded_image_for_io_adapters { "This is it" }
    like { 1 }
    dislike { 0 }
  end
   factory :post_with_gif do
    trait :with_image do
      after :build do |post|
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
