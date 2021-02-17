class CommentsController < ApplicationController
  before_action :set_currentpost
  before_action :set_comment, only: [:updatecomment, :deletecomment]



  # GET /posts/:id/comments
  def getcomments
     comments = Comment.where(post_id:@current_post[:id])
     render json:comments
  end


  # POST /posts/:id/comments
  def addcomment
    params.require(:body)
    comment = Comment.new(body:params[:body],user_id:@current_user[:id],post_id:@current_post[:id])
    if comment.save
      render json: {done:"Comment Created Successfully"}
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # PUT or PATCH /posts/:id/comments/:comment_id
  def updatecomment
    params.require(:body)
    if @current_comment[:user_id] != @current_user[:id]
      render json:{error:"You don't have permissions to update this comment"}
    else
      @current_comment.update_attribute(:body,params[:body])
      if @current_comment.save
          render json: {done:"Comment Updated Successfully"}
      else
          render json: @current_comment.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/:id/comments/:comment_id
  def deletecomment
      if @current_comment[:user_id] != @current_user[:id]
          render json: {error:"You Don't have permissions to delete this comment"}
     else
        if @current_comment.destroy
            render json: {done:"Comment Deleted"}
        else
            render json: @current_comment.errors, status: :unprocessable_entity
        end
      end
  end


  private
    def set_comment
      @current_comment = Comment.find(params[:comment_id])
    end
    def set_currentpost
      @current_post = Post.find(params[:id])
    end
end
