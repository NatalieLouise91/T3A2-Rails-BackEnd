class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :event_id, :start_time, :end_time, :role, :name, presence: true
end