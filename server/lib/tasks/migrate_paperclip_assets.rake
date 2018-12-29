desc 'Generates file names on AWS S3 and places them in their proper structure'
namespace :posts do
  task migrate_to_active_storage: :environment do
    Post.where.not(image_file_name: nil).find_each do |post|
      img = post.image_file_name
      ext = File.extname(img)

      image_url =
      "https://#{Rails.application.credentials.dig(:aws,
      :bucket_name)}.#{Rails.application.credentials.dig(:aws,
      :host_name)}/posts/images/000/000/0#{post.id}/original/#{img}"
      puts image_url # For verification
      download = open(image_url)
      post.image.attach(io: open(image_url), filename: post.image_file_name,
      content_type: post.image_content_type)
    end
  end
end
