class FavoritesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @favorite_topics = current_user.favorite_topics.order(created_at: :desc)
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    
    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to topics_oath, danger: 'お気に入りの登録に失敗しました'
    end
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    favorite.destroy
    redirect_back(fallback_location: root_path)
    
  end
end
