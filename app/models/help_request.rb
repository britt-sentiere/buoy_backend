class HelpRequest < ApplicationRecord
  belongs_to :student
  belongs_to :course

  has_many :students
  has_many :participations
end
