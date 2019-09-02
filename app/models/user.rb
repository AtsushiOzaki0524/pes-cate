class User < ApplicationRecord
  validates :name, presence: true,uniqueness: true, length: {maximum: 15}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: {minimum: 5,maximum: 32},
                      format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
  has_many :comments
end
