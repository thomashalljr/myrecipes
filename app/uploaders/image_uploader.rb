class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Empty because we're directly uploading images from browser
  # https://cloudinary.com/documentation/rails_image_and_video_upload#direct_uploading_from_the_browser
end
