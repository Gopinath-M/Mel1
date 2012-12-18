class DeclarationProperty < ActiveRecord::Base
   mount_uploader :property_file, DeclarationPropertyUploader
end
