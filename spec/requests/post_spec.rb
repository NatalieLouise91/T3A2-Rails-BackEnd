require 'rails_helper'

RSpec.describe '/api/events', type: :request do

   let(:valid_attributes) do
      {
         'name' => 'test-name',
         'description' => "A valid description",
         'date' => "05-10-2022",
         'attendees' => 1,
         'location' => "Test location",
         'time' => "10pm",
         'contact_name' => "test-contact-name",
         'contact_phone' => 1
      }
   end

   let(:invalid_attributes) do
      {
         'name' => 'a',
         'description' => "a",
         'date' => "5",
         'attendees' => '',
         'location' => "a",
         'time' => "aaa",
         'contact_name' => "a",
         'contact_phone' => ''
      }
   end

   describe "GET /index" do
      it "renders a successful response" do
         Event.create! valid_attributes
         get events_url
         expect(response).to be_successful
      end
   end

   describe "GET /create" do
      it "renders a successful response" do
         Event.create! valid_attributes
         get events_url
         expect(response).to be_successful
      end
   end

   describe "GET /show" do
      it "renders a successful response" do
        event = Event.create! valid_attributes
         get events_url(event)
         expect(response).to be_successful
      end
   end

   describe "GET /update" do
      it "renders a successful response" do
        event = Event.create! valid_attributes
         get events_url(event)
         expect(response).to be_successful
      end
   end

   describe "GET /destroy" do
      it "renders a successful response" do
        event = Event.create! valid_attributes
         get events_url(event)
         expect(response).to be_successful
      end
   end
end