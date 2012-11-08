class ResourceBooking < ActiveRecord::Base
  belongs_to :bookable, :polymorphic=>true
end
