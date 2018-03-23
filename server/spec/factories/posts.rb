FactoryBot.define do
  factory :post do
    image  { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'uofmeme_logo.png'), 'image/png') }
    file_name { Faker::File.file_name(Rails.root.join('app', 'assets', 'images',  'uofmeme_logo.png')) }
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
  end
end