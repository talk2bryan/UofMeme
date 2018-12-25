desc 'Generates file names on AWS S3 and places them in their proper structure'
namespace :posts do
  task migrate_to_active_storage: :environment do
    Post.where.not(image_file_name: nil).find_each do |post|
      img = post.image_file_name
      ext = File.extname(img)
      img_original = CGI.unescape(img.gsub(ext, '_original#{ext}'))

      image_url =
      'https://s3.amazonaws.com/#{Rails.application.credentails.dig(:aws,
      :bucket_name)}/posts/#{post.id}/#{img_original}'
      puts image_url
      post.image.attach(io: open(image_url),
                            filename: post.image_file_name,
                            content_type: post.image_content_type)
    end
  end
end
