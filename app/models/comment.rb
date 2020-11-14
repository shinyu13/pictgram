class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :contents, presence: true
  
  belongs_to :topics
  belongs_to :user
  
end
