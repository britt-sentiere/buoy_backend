class Participation < ApplicationRecord
  has_many :students # may need to specify class name of User
  belongs_to :course
end
