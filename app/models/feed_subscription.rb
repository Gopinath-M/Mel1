class FeedSubscription < ActiveRecord::Base
  belongs_to :subscriber, :class_name=>'User'
  belongs_to :activity_feed
end
