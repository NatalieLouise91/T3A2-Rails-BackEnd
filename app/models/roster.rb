class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :event
  has_one :rostered_tm, dependent: :destroy, autosave: true
  validates :start_time, :end_time, presence: true
  accepts_nested_attributes_for :role
  accepts_nested_attributes_for :rostered_tm

  def transform_roster
    return { 
       start_time: self.start_time,
       start_end: self.end_time,
       role: self.role,
       first_name: self.first_name,
       last_name: self.last_name,
       posted: self.created_at,
       updated: self.updated_at
     }
  end

end