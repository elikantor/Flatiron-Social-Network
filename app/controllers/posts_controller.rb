class PostsController < ApplicationController
    before_action :find_post, only:[:show,:edit,:update,:destroy,:profile_d]

    def index
        @posts = Post.order('updated_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            @post.img_url = Scraper.post(@post.content)
            @post.save
            redirect_to home_path
        else
            redirect_to home_path
        end

        # redirect_to post_path(@post)
        # redirect_to home_path
    end

    def show
       # @post = Post.find(params[:id])
       @comment = Comment.new
       @like = Like.new
    end

    def edit
        #@post = Post.find(params[:id])
            if @post.user != @logged_in_user
                redirect_to @post
            end

    end

    def update
        old_content = @post.content
        @post.update(post_params)
        if @post.content != old_content
            @post.update(img_url: Scraper.post(@post.content))
        end
        redirect_to post_path(@post)
    end

    def destroy
        @user = @post.user
        @post.destroy
        redirect_to home_path
    end

    def profile_d
        @user = @post.user
        @post.destroy
        redirect_to user_path(@user)
    end

    private

    def post_params
        params.require(:post).permit(:content,:user_id)
    end
    
    def find_post
        @post = Post.find(params[:id])
    end
end
