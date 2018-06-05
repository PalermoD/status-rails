class StaticPagesController < ApplicationController
  def home
      if logged_in?
       @micropost  = current_user.microposts.build
       @feed_items = current_user.feed.order(created_at: :desc).paginate(page: params[:page])
     end
  end

  def global
      if logged_in?
       @micropost  = current_user.microposts.build
       @global_items = current_user.global.paginate(page: params[:page])
     end
  end

  def help
  end
end
