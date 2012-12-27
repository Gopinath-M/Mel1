class FeedsController < ApplicationController
   def index
    @feeds = current_user.activity_feeds.order("created_at desc").page(params[:page]).per(30)
  end
end
