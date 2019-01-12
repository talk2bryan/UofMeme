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
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
    uploaded_image_for_io_adapters { "This is it" }
    like { 1 }
    dislike { 0 }
  end
end
