class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :event
end