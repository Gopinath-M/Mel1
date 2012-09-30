class CmsPage < ActiveRecord::Base
   mount_uploader :cms_page, ContentUploader
end
