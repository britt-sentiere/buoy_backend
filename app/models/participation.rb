class Participation < ApplicationRecord
  belongs_to :student
  belongs_to :course
  has_many :help_requests
end
