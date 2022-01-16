class EventsController < ApplicationController
    before_action :authenticate_user, except: [:index, :show, :create] 
    before_action :find_event, only: [:show, :update, :destroy]
    before_action :check_host_or_admin, only: [:destroy, :update] 


    # method to show all associated events in database, order by date ascending
    def index
        @events = Event.order(date: :asc)
        render json: @events
    end

    # method to create an event 
    def create

        name = params["name"]
        description = params["description"]
        date = params["date"]
        attendees = params["attendees"]
        location = params["location"]
        time = params["time"]
        contact_name = params["contact_name"]
        contact_phone = params["contact_phone"]
        id = params["id"]
        author = params["author"]
        user_id = 1

        @event = current_user.events.create(id: id.to_i, user_id: user_id.to_i, name: name, description: description, date: date, attendees: attendees.to_i, location: location, time: time, contact_name: contact_name, contact_phone: contact_phone.to_i, author: author)
        if @event.errors.any?
            render json: @event.errors, status: :unprocessable_entity
        else
            render json: @event, status: 201
        end
    end

    # method to show an individual event and transform that event via method in event model
      
    def show
        render json: @event.transform_event
    end

    # method to update an event and its associated foreign key roster entity

    def update

        @event = Event.find_by_id(params[:id])
        @event.name = params[:name]
        @event.description = params[:description]
        @event.date = params[:date]
        @event.attendees = params[:attendees]
        @event.location = params[:location]
        @event.time = params[:time]
        @event.contact_name = params[:contact_name]
        @event.contact_phone = params[:contact_phone]
        @event.author = params[:author]
        @event.user_id = 1

        @event.save

        if @event.errors.any?
            render json: @event.errors, status: :unprocessable_entity
        else
            render json: @event, status: 201
        end
    end

    # Destroying roster by finding by id in params, destroying all associated foreign keys, rosters

    def destroy
        @event = Event.find_by_id(params[:id])
        if @event
          @event.destroy
          render json: @event, status: 201
        end 
    end
    
    private

    # method for before_action callback to find an event

    def find_event
        begin
            @event = Event.find(params[:id])
        rescue
            render json: {error: "event does not exist"}, status: 404
        end
    end

    # method for before_action callback to check admin

    def check_host_or_admin
        if current_user.id != @event.user.id
            if !current_user.admin
                render json: {error: "unauthorized action"}, status: 401
            end
        end
    end

    # Required params for the creation of an event

    def event_params
        params.require(:event).permit(:id, :name, :description, :date, :attendees, :location, :time, :contact_name, :contact_phone, :author)
    end

end