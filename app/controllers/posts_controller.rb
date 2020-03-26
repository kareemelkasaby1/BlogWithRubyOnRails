class PostsController < ApplicationController

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_param)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_param)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @comment = @post.comments.where(post_id: @post.id) 
        @comment.each do |comment|
            comment.destroy
        end
        @post = Post.find(params[:id])
        @post.destroy()
        redirect_to posts_path
    end
    private

    def post_param
        params.require(:post).permit(:title, :content)
    end

end
