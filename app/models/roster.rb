class Roster < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :event_id, :start_time, :end_time, :role, :name, presence: true

  # a roster belongs to an event and a user 
  # validation of required params to ensure these params are filled out in forms

end