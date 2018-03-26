FactoryBot.define do
  factory :post do
    image  { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'mememan.jpg'), 'image/jpg') }
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
    uploaded_image_for_io_adapters { "This is it" }
    like { 1 }
    dislike { 0 }
  end
end