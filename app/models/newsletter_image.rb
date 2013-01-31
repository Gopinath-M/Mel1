class NewsletterImage < ActiveRecord::Base

  #helper for carrier wave
  mount_uploader :image, NewsletterImageUploader

end
