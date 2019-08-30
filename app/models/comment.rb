class Comment < ApplicationRecord
  validates :content, presence: true, length: {maximum: 100}
  
  
  belongs_to :topic
  belongs_to :user
end
