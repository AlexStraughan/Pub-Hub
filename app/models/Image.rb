class Image < ApplicationRecord

  def image_url
    super || default_image
  end
end
