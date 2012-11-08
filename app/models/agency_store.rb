class AgencyStore < ActiveRecord::Base
  belongs_to :agency

  scope :active, where(:is_active => true, :deleted => false)
end
