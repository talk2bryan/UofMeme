FactoryBot.define do
  factory :post do
    image  { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'rspec', '000', 'original', 'test.png'), 'image/png') }
    file_name { Faker::File.file_name(Rails.root.join('app', 'assets', 'images', 'rspec', '000', 'original', 'test.png')) }
    poster { Faker::Lorem.characters(30) }
    description { Faker::Lorem.sentence }
  end
end