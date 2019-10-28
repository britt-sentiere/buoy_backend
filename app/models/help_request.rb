class HelpRequest < ApplicationRecord
  belongs_to :participation
  has_one :student, through: :participation
end
