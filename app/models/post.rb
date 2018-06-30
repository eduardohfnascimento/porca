class Post < ApplicationRecord
  belongs_to :professor
  belongs_to :course
  belongs_to :user
  
  validates :user_id, presence: true
  validates :semester, length: {maximum: 6}

  default_scope -> {order(created_at: :desc)}
end
