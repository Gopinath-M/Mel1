class ConversationGroup < ActiveRecord::Base
   belongs_to :user, :counter_cache => true

  scope:convos, lambda { |*args|
    {:conditions=>["(from_groupid =? and to_groupid=?) or ((from_groupid =? and to_groupid=?))", args[0],args[1],args[1],args[0]]}
  }
end
