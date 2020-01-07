class LikesController < ApplicationController

    def new
        @like = Like.new 
    end

    def create 
        if @like = Like.find_by(user_id: @logged_in_user.id, post_id: like_params[:post_id])
            # @post_id = @like.post_id
            @like.destroy
        else 
            @like = Like.create(like_params)
            # @post_id = @like.post_id
        end
        redirect_to post_path(@like.post_id)
    end

    private
    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end

end
