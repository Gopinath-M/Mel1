class FeedObject < ActiveRecord::Base
  belongs_to :activity_feed

  def self.convert(objects)
    fos=[]
    objects.each do |k,v|
      fos << FeedObject.create!(:name=>k.to_s,:object_type=>v.class.name,:object_id=>v.id)
    end
    fos
  end

  def get_object
    Kernel.const_get(self.object_type).find(self.object_id)
  end
  
  #FeedObject.feed_object_for(candidate)
  def self.feed_object_for(obj)
    FeedObject.where(:object_type=>obj.class.name,:object_id=>obj.id)
  end
end
