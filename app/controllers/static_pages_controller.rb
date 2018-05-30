class StaticPagesController < ApplicationController
  def home
      if logged_in?
       @micropost  = current_user.microposts.build
       @feed_items = current_user.feed.paginate(page: params[:page])
     end
  end

  def global
      if logged_in?
       @micropost  = current_user.microposts.build
       @global_items = Micropost.all.paginate(page: params[:page])
       @microposts = Micropost.all
     end
  end

  def help
  end
end
