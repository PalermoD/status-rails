class CommentsController < ApplicationController
    before_action :set_micropost


    def create
        @comment = @micropost.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save

            redirect_to request.referrer
        else
            flash[:alert] = "Check the comment form, something went wrong. ¯\_(ツ)_/¯"
            redirect_to request.referrer
        end
    end

    def destroy
        @comment = @micropost.comments.find(params[:id])

        @comment.destroy
        flash[:success] = "Comment deleted :("
        redirect_to request.referrer
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :picture)
    end

    def set_micropost
        @micropost = Micropost.find(params[:micropost_id])
    end

    def set_user
        @user = User.find(params[:user_id])
    end

end
