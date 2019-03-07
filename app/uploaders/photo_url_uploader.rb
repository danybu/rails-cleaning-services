class PhotoUrlUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave

end
