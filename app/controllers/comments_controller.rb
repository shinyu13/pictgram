class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: "コメントが保存されました"
    else
      flash.now[:danger] = "コメントに失敗しました"
      Rails.logger.info(@comment.errors.inspect)
      render :new 
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:contents, :topic_id)
  end
end
