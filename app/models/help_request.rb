class HelpRequest < ApplicationRecord
  belongs_to :participation
  has_one :course, through: :participation
  has_one :student, through: :participation

  def formatted_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
