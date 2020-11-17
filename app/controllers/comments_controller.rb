class CommentsController < ApplicationController
  
  def index
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash.now[:sucess] =  "コメントが保存されました"
      redirect_to topics_path
    else
      flash.now[:danger] = "コメントに失敗しました"
      Rails.logger.info(@comment.errors.inspect)
      render :new 
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end
