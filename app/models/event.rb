class Event < ApplicationRecord
   validates :name, presence: true, length: {minimum: 2}
   validates :description, presence: true, length: {in: 5..100}
   validates :date, presence: true
   validates :attendees, presence: true, numericality: {only_integer: true}
   validates :location, presence: true, length: {minimum: 10}
   validates :time, presence: true, length: {minimum: 4}
   validates :contact_name, presence: true, length: {minimum: 2}
   validates :contact_phone, presence: true, numericality: {only_integer: true}
   belongs_to :user
   has_many :rosters, dependent: :destroy, autosave: true


  # transform_event method to provide additional details for an event's show method
   def transform_event
      return { 
         author: self.user.email,
         event_name: self.name,
         description: self.description,
         date: self.date,
         attendees: self.attendees,
         location: self.location,
         time: self.time,
         contact_name: self.contact_name,
         contact_phone: self.contact_phone,
         posted: self.created_at,
         updated: self.updated_at
       }
   end
end

