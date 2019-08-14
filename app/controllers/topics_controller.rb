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
  
  private
  def topic_params
    params.require(:topic).permit(:url, :description)
  end
end
