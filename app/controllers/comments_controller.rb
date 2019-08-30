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
      redirect_to topic_path(@comment.topic_id), success: 'コメントを投稿しました'
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      Rails.logger.info(@comment.errors.inspect)
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]
    @topic = @comment.topic_id
    if @comment.update(comment_params)
      redirect_to topic_path(@topic), success: 'コメントを更新しました'
    else
      flash.now[:danger] = "コメントの編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    comment = Comment.find_by(user_id: current_user.id, id: params[:comment_id])
    @topic = comment.topic_id
    comment.destroy
    redirect_to topic_path(@topic), danger: 'コメントを消去しました'
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end
  
  def edit_comment_params
    params.require(:comment).permit(:content, :id)
  end
end
