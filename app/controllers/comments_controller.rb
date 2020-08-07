class CommentsController < ApplicationController

    def create
        @comment = current_user.comments.build(comment_params)
        @post = @comment.post
        if @comment.save
            redirect_to posts_path
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:post_id, :comment)
        end

end
