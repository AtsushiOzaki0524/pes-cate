class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  #youtubeのみ許可
  validates :url, presence: true, 
                  format:{ with: /(youtu\.be\/|youtube.com\/watch\?(?=[^?]*v=\w+))(?:[^\s?]+)?\z/ , message: "無効なリンクです"}
  #/youtu/
  
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  
  has_many :comments
end

