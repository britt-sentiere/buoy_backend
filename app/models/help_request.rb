class HelpRequest < ApplicationRecord
  belongs_to :participation
  has_one :student, through: :participation

  def formatted_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end
end
