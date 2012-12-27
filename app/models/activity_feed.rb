class ActivityFeed < ActiveRecord::Base
  belongs_to :actor, :class_name=>'User'
  has_many :feed_subscriptions
  has_many :subscribers, :through=>:feed_subscriptions
  has_many :feed_objects

  def locals
    objs={}
    self.feed_objects.each do |fo|
      objs[fo.name.to_sym]=fo.get_object
    end
    objs
  end

  def template
    if(Kernel.const_get(self.for).respond_to?("#{self.feed_type}_feed_template".to_sym))
      return Kernel.const_get(self.for).send("#{self.feed_type}_feed_template".to_sym)
    else
      "feeds/#{self.for.underscore}/{self.type}"
    end
  end
end
