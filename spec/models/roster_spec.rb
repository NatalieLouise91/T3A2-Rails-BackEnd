require 'rails_helper'

RSpec.describe Roster, type: :model do

   @user
   @roster
   @event

   before(:all) do
      @user = User.create!(
         email: "eric123@test.com", 
         password: "password1", 
         password_confirmation: "password1", 
         first_name: "Johnny", 
         last_name: "Nguyen", 
         phone: 000000, 
         admin: true
      )
      @event = Event.create!(
        user_id: @user.id,
        name: "Anniversary",
        description: "happy event",
        date: "2022/01/20",
        attendees: 30,
        location: "Brisbane City",
        time: "2.30pm",
        contact_name: "Johnny",
        contact_phone: 111111,
        author: "johnny@test.com" 
    )
   end

   after(:all) do
      User.delete(@user.id)
      Event.delete(@event.id)
   end

   it "has a start_time" do
      roster = Roster.new(
         start_time: '',
         end_time: "end time",
         role: "role",
         name: "name",
         author: "author",
         user_id: @user.id,
         event_id: @event.id,
      )
      expect(roster).to_not be_valid

      roster.start_time = 'start time'
      expect(roster).to be_valid

      expect(roster.start_time).to eq('start time')
   end

   it 'has an end_time' do
    roster = Roster.new(
      start_time: 'start time',
      end_time: "",
      role: "role",
      name: "name",
      author: "author",
      user_id: @user.id,
      event_id: @event.id,
   )
   expect(roster).to_not be_valid

   roster.end_time = 'end time'
   expect(roster).to be_valid

   expect(roster.end_time).to eq('end time')
   end
   
   it 'has a role' do
    roster = Roster.new(
      start_time: "start time",
      end_time: "end time",
      role: "",
      name: "name",
      author: "author",
      user_id: @user.id,
      event_id: @event.id,
   )
   expect(roster).to_not be_valid

   roster.start_time = 'role'
   expect(roster).to be_valid

   expect(roster.start_time).to eq('role')
   end

   it 'has a name' do
    roster = Roster.new(
      start_time: 'start time',
      end_time: "end time",
      role: "role",
      name: "",
      author: "author",
      user_id: @user.id,
      event_id: @event.id,
   )
   expect(roster).to_not be_valid

   roster.name = 'name'
   expect(roster).to be_valid

   expect(roster.name).to eq('name')
   end

   it 'has an author' do
    roster = Roster.new(
      start_time: 'start time',
      end_time: "end time",
      role: "role",
      name: "name",
      author: "",
      user_id: @user.id,
      event_id: @event.id,
   )
   expect(roster).to_not be_valid

   roster.author = 'author'
   expect(roster).to be_valid

   expect(roster.author).to eq('author')
   end

end

