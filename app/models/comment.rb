class Comment < ApplicationRecord
  belongs_to :topics
  belongs_to :user
  validates :content, presence: true
end
