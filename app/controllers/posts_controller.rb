class PostsController < ApplicationController
    before_action :set_posts, only: [:show]
    
    def index
    end
    
     def new
         @post = Post.new
     end
     
     def create
        @post = Post.new(post_params)
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
