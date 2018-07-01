class Post < ApplicationRecord
  belongs_to :professor, optional: true
  belongs_to :course, optional: true
  belongs_to :user, optional: true
  
  validates :name, presence: true
  validates :link, presence: true
  validates :semester, length: {maximum: 6}

  default_scope -> {order(created_at: :desc)}

  filterrific(
    available_filters: [
      :with_course_id,
    ]
  )

  scope :with_course_id, lambda { |course_ids|
    where(course_id: [*course_ids])
  }

  #scope :with_course_id, -> { where(course_id: ?, course_id)}
end
