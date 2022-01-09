require 'rails_helper'

RSpec.describe Event, type: :model do
   @user

   before(:all) do
      @user = User.create!(
         email: "eric123@test.com", password: "password1", password_confirmation: "password1", first_name: "Johnny", last_name: "Nguyen", phone: 000000, admin: true
      )
   end

   after(:all) do
      User.delete(@user.id)
   end

   it "has a name" do
      event = Event.create(
         name: '',
         description: "A valid description",
         date: "05-10-2022",
         attendees: 1,
         location: "Test location",
         time: "10pm",
         contact_name: "test-contact-name",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.name = 'Test name'
      expect(event).to be_valid
      expect(event.name).to eq('Test name')
   end

   it 'has a description' do
      event = Event.new(
         name: 'test-name',
         description: "",
         date: "05-10-2022",
         attendees: 1,
         location: "Test location",
         time: "10pm",
         contact_name: "test-contact-name",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.description = 'test-description'
      expect(event).to be_valid
      expect(event.description).to eq 'test-description'
   end
   
   it 'has a date' do
      event = Event.new(
         name: 'test-name',
         description: "A valid description",
         date: "",
         attendees: 1,
         location: "Test location",
         time: "10pm",
         contact_name: "test-contact-name",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.date = 'test-date'
      expect(event).to be_valid
      expect(event.date).to eq 'test-date'
   end

   it 'has attendees' do
      event = Event.new(
         name: 'test-name',
         description: "A valid description",
         date: "05-10-2022",
         attendees: '',
         location: "Test location",
         time: "10pm",
         contact_name: "test-contact-name",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.attendees = 1
      expect(event).to be_valid
      expect(event.attendees).to eq 1
   end

   it 'has a location' do
      event = Event.new(
         name: 'test-name',
         description: "A valid description",
         date: "05-10-2022",
         attendees: 1,
         location: "",
         time: "10pm",
         contact_name: "test-contact-name",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.location = 'test location'
      expect(event).to be_valid
      expect(event.location).to eq 'test location'
   end

   it 'has a time' do
      event = Event.new(
         name: 'test-name',
         description: "A valid description",
         date: "05-10-2022",
         attendees: 1,
         location: "Test location",
         time: "",
         contact_name: "test-contact-name",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.time = 'test-time'
      expect(event).to be_valid
      expect(event.time).to eq 'test-time'
   end

   it 'has a contact name' do
      event = Event.new(
         name: 'test-name',
         description: "A valid description",
         date: "05-10-2022",
         attendees: 1,
         location: "Test location",
         time: "10pm",
         contact_name: "",
         contact_phone: 1,
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.contact_name = 'test-contact-name'
      expect(event).to be_valid
      expect(event.contact_name).to eq 'test-contact-name'
   end

   it 'has a contact_phone' do
      event = Event.new(
         name: 'test-name',
         description: "A valid description",
         date: "05-10-2022",
         attendees: 0,
         location: "Test location",
         time: "10pm",
         contact_name: "test-contact-name",
         contact_phone: '',
         user_id: @user.id
      )
      expect(event).to_not be_valid
      event.contact_phone = 1
      expect(event).to be_valid
      expect(event.contact_phone).to eq 1
   end
end

