class Course < ApplicationRecord
  has_many :posts

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end

end
