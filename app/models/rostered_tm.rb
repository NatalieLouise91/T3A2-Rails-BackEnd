class RosteredTm < ApplicationRecord
  belongs_to :roster
  validates :first_name, :last_name, presence: true
end
