class User < ApplicationRecord
  belongs_to :student
  belongs_to :teacher

  has_many :help_requests
  has_many :participations
  has_many :courses
end
