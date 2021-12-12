require "rails_helper"

# describe VersionsController do
#   describe 'routing' do
#     it 'routes GET /version to VersionsController#show' do
#       expect(get: '/version').to route_to(controller: 'versions', action: 'show')
#     end
#   end
# end

RSpec.describe EventsController, type: :routing do
   describe "routing" do
      it "routes to #index" do
         expect(get: "api/events").to route_to("events#index")
      end

      it "routes to #create" do
         expect(post: "api/events").to route_to("events#create")
      end

      it "routes to #show" do
         expect(get: "api/events/1").to route_to(controller: 'events', action: 'show', id: '1')
      end

      it "routes to #update" do
         expect(put: "api/events/1").to route_to(controller: 'events', action: 'update', id: '1')
      end

      it "routes to #destroy" do
         expect(delete: "api/events/1").to route_to(controller: 'events', action: 'destroy', id: '1')
      end

   end
end