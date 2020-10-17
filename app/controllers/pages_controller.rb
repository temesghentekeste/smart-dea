class PagesController < ApplicationController
  def index
  end
  
  def home
    @posts = Post.all
    if user_signed_in?
      @newPost = current_user.posts.build
    end
  end

  def profile
    # grap the username from the URL
    if(User.find_by_username(params[:id]))
      @username = params[:id]
      @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
      @newPost = Post.new
    else
      # redirect to 404 (root for now)
      redirect_to root_path, notice: 'User not found'
    end

  end
  
  def explore
    @posts = Post.all
  end
end
