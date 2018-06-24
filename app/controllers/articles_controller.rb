class ArticlesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def new
    end

    def create
      @article = current_user.articles.build(article_params)
      # @article = @user.articles.build(article_params)
      # @article.user = current_user
      @global_items = current_user.global.paginate(page: params[:page])
      if @article.save
          flash[:success] = "created"
        render 'show'
      else
        @feed_items = []
        flash[:success] = "Not created"
        render 'static_pages/home'
      end
    end



    def destroy
      @article.destroy
      flash[:success] = "Post deleted"
      redirect_to request.referrer || root_url
    end

    def show
     @article = Article.find(params[:id])


    end

    def upvote
          @article = article.find(params[:id])

          respond_to do |format|
          unless current_user.voted_for? @article
            format.html { redirect_to :back }
            format.json { head :no_content }
            format.js { render :layout => false }
            @article.cached_votes_total = @article.cached_votes_total + 1
            @article.save
            @article.upvote_by current_user
          else

            format.html { redirect_to :back }
            format.json { head :no_content }
            format.js
          end
        end
      end


      def downvote
          @article = article.find(params[:id])

          respond_to do |format|
          unless current_user.voted_for? @article
            format.html { redirect_to :back }
            format.json { head :no_content }
            format.js { render :layout => false }
            @article.cached_votes_total = @article.cached_votes_total + 1
            @article.save
            @article.downvote_by current_user
          else

            format.html { redirect_to :back }
            format.json { head :no_content }
            format.js
          end
        end
      end

    private

      def article_params
        params.require(:article).permit(:content, :picture, :title)
      end

      def correct_user
        @article = current_user.articles.find_by(id: params[:id])
        redirect_to root_url if @article.nil?
      end
end
