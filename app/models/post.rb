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
      :with_professor_id,
      :with_semester_gte,
    ]
  )

  scope :with_course_id, -> course_id {
    where(course_id: course_id)
  }

  scope :with_professor_id, -> professor_ids {
    where(professor_id: [*professor_ids])
  }

  scope :with_semester_gte, -> semester {
    where("semester >= ?", semester)
  }

  scope :search_query, lambda { |query|
    return nil  if query.blank?
  
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
  
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments.
    num_or_conds = 3
    where(
      terms.map { |term|
        "(LOWER(posts.name) LIKE ? OR LOWER(post.course.name) LIKE ? OR LOWER(post.course.alias) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

end
