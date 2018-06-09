class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to request.referrer
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  def show
   @micropost = Micropost.find(params[:id])


  end

  def upvote
        @micropost = Micropost.find(params[:id])

        respond_to do |format|
        unless current_user.voted_for? @micropost
          format.html { redirect_to :back }
          format.json { head :no_content }
          format.js { render :layout => false }
          @micropost.cached_votes_total = @micropost.cached_votes_total + 1
          @micropost.save
          @micropost.upvote_by current_user
        else

          format.html { redirect_to :back }
          format.json { head :no_content }
          format.js
        end
      end
    end


    def downvote
        @micropost = Micropost.find(params[:id])

        respond_to do |format|
        unless current_user.voted_for? @micropost
          format.html { redirect_to :back }
          format.json { head :no_content }
          format.js { render :layout => false }
          @micropost.cached_votes_total = @micropost.cached_votes_total + 1
          @micropost.save
          @micropost.downvote_by current_user
        else

          format.html { redirect_to :back }
          format.json { head :no_content }
          format.js
        end
      end
    end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
