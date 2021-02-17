class PostsController < ApplicationController
  before_action :set_post, only: [:updatepost, :updateposttags, :deletepost]


  
  # GET /posts
  def getposts
    posts = Post.all
    render json: posts
  end

  # GET /posts/:id && GET /posts/me
  def getpostbyId
    if params[:id]!= "me"
      post = Post.find(params[:id])
      render json: post
    else
        post = Post.where(user_id:@current_user[:id])
        render json: post
    end
  end

  # POST /posts 
  def addpost
    params.require(:title)
    params.require(:body)
    params.require(:tags)
    post = Post.new(title:params[:title],body:params[:body],user_id:@current_user[:id],tags:params[:tags])
    if post.save
      render json: {done:"Post Created Successfully"}
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  # PUT or PATCH /posts/:id
  def updatepost
     post = Post.find(params[:id])
     if post[:user_id] != @current_user[:id]
        render json: {error:"You Don't have permissions to update this post"}
     else
        if params[:title]
           post.update_attribute(:title,params[:title])
        end
        if params[:body]
          post.update_attribute(:body,params[:body])
        end
        if params[:tags]
          post.update_attribute(:tags,params[:tags])
        end
        if post.save
          render json: {done:"Post Updated Successfully"}
        else
          render json: post.errors, status: :unprocessable_entity
        end
     end 
  end

  # PUT or PATCH /posts/:id/tags
  def updateposttags 
    params.require(:tags)
    @currnet_post.update_attribute(:tags,params[:tags])
    if @currnet_post.save
        render json: {done:"Post Tags Updated Successfully"}
    else
        render json: @currnet_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def deletepost
      if @currnet_post[:user_id] != @current_user[:id]
          render json: {error:"You Don't have permissions to delete this post"}
     else
        if @currnet_post.destroy
            render json: {done:"Post Deleted"}
        else
            render json: @currnet_post.errors, status: :unprocessable_entity
        end
      end
  end


  private
    def set_post
      @currnet_post = Post.find(params[:id])
    end
end