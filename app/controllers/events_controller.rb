class EventsController < ApplicationController
   def index
      @events = Event.all
      render json: @events
   end

   def show
      @events = Event.find(params[:id])
      render json: @events
   end

   def create
      @Event = Event.create(event_params)

      if @event.save
         render json: @event, status: :created
      else 
         render json: @event.errors, status: :unprocessable_entity
      end
   end

   def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
         render json: @event
      else
         render json: @event.errors, status: :unprocessable_entity
      end
   end

   def destroy
      @event = Event.find(params[:id])
      @event.destroy
   end

   ######################################################

   private
   def event_params
      params.permit(:name, :description, :date, :attendees, :location, :time, :contact_name, :contact_phone)
   end

end

