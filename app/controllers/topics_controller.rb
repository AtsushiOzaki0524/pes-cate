class TopicsController < ApplicationController
  before_action :authenticate_user, only:[:new]
  
  
  def index
      @topics = Topic.all.includes(:favorite_users, :comments)
      
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    
  end
  
  def edit
    @topic = Topic.find_by(id: params[:id])
  end
  def update
    @topic = Topic.find_by(id: params[:id])
    if @topic.update(topic_params)
      redirect_to topic_path(@topic), success: '投稿内容を更新しました'
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    topic = Topic.find_by(user_id: current_user.id, id: params[:id])
    topic.destroy
    redirect_to topics_path, danger: '投稿を消去しました'
  end
  
  private
  def topic_params
    params.require(:topic).permit(:url, :description)
  end
  
  
end
