class StaticPagesController < ApplicationController
  def home
      if logged_in?
       @micropost  = current_user.microposts.build
       @article = current_user.articles.paginate(page: params[:page])

       @global_items = current_user.global.paginate(page: params[:page])
     end
  end

  def global
      if logged_in?
       @micropost  = current_user.microposts.build
       @feed_items = current_user.feed.order(created_at: :desc).paginate(page: params[:page])
       @article = current_user.articles.paginate(page: params[:page])
       @global_items = current_user.global.paginate(page: params[:page])
     end
  end

  def newposts
      if logged_in?
       @micropost  = current_user.microposts.build
       @new_items = current_user.newposts.order(created_at: :desc).paginate(page: params[:page])
       @article = current_user.articles.paginate(page: params[:page])
     end
  end

  def create
      if logged_in?
       @micropost  = current_user.microposts.build
      end
  end

  def help
  end
end
