class PostsController < ApplicationController
    before_action :set_posts, only: [:show]
    
    def index
        @posts = Post.all
    end
    
     def new
         @post = Post.new
     end
     
     def create
        @post = Post.new(post_params)
        #  below means users not signed in
        @post.user_id = current_user.id
        if @post.save
            # if saved redirect to our show page, post_path(@post)
            redirect_to post_path(@post), notice: 'Post was successfully created.'
        else
            render :new
        end
     end
     
     def show
         set_posts
     end
     
private
    
    def post_params
        params.require(:post).permit(:date, :rationale)
    end
    
    def set_posts
        @post = Post.find(params[:id])
    end
end
