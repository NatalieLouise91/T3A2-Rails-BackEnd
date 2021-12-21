class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :start_time, :end_time, :role, :name, presence: true

  def transform_roster
    return { 
       start_time: self.start_time,
       start_end: self.end_time,
       role: self.role,
       name: self.name,
       posted: self.created_at,
       updated: self.updated_at
     }
  end

end