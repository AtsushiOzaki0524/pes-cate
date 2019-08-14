class CommentsController < ApplicationController
  before_action :authenticate_user
  
  def new
    @topic = Topic.find_by(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:topic_id]
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      Rails.logger.info(@comment.errors.inspect)
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end
end
