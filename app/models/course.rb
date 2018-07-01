class Course < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :alias, presence: true, uniqueness: true

  filterrific(
    available_filters: [
      :search_query,
      :with_semester,
    ]
  )

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end

  def self.semesters_for_select
    semesters = ('1'..'9').to_a
    semesters.push('Eletiva')
    semesters.map { |e| [e, e] }
  end

  scope :with_semester, -> (semester) { where semester: semester }

  scope :search_query, lambda { |query|
    # Searches the courses table on the 'name' and 'alias' columns.
    # Matches using LIKE, automatically appends '%' to each term.
    return nil  if query.blank?
  
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
  
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(courses.name) LIKE ? OR LOWER(courses.alias) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

end
