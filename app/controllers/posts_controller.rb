class PostsController < ApplicationController
    before_action :set_posts, only: [:show, :edit, :update, :destroy, :approve]
    
    def index
        @posts = Post.posts_by(current_user).page(params[:page]).per(10)
    end
    
    def approve
        authorize @post
    	@post.approved!
    	redirect_to root_path, notice: "The post has been approved"
    end
    
     def new
         @post = Post.new
     end
     
     def edit
        authorize @post
     end
     
     def update
        authorize @post
        if @post.update(post_params)
            # if saved redirect to our show page, post_path(@post)
            redirect_to post_path(@post), notice: 'Post was successfully edited.'
        else
            render 'edit'
        end
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
     
     def destroy
        @post.delete     
        redirect_to posts_path, notice: 'Post was successfully Deleted.'
     end
     
private
    
    def post_params
        params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end
    
    def set_posts
        @post = Post.find(params[:id])
    end
end
