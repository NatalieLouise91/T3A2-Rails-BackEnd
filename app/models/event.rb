class Event < ApplicationRecord
   validates :name, presence: true, length: {minimum: 2}
   validates :description, presence: true, length: {in: 5..100}
   validates :date, presence: true
   validates :attendees, presence: true, numericality: {only_integer: true}
   validates :location, presence: true, length: {minimum: 10}
   validates :time, presence: true, length: {minimum: 4}
   validates :contact_name, presence: true, length: {minimum: 2}
   validates :contact_phone, presence: true, numericality: {only_integer: true}
end
