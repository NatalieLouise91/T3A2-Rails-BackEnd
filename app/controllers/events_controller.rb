class EventsController < ApplicationController
    before_action :authenticate_user, except: [:index, :show] 
    before_action :find_event, only: [:show, :update, :destroy]
    before_action :check_ownership, only: [:destroy, :update] 

    def index
        @events = Event.all
      #   if (params[:username])
      #       event.find_by_user(params[:username]).order('updated_at DESC').each do |event|
      #           @events << Event.find_by(id: event.id).transform_event
      #       end
      #   else
      #       Event.order('updated_at DESC').each do |event|
      #           @events << Event.find_by(id: event.id).transform_event
      #       end
      #   end
        render json: @events
    end

    def create
        # @event = Event.create(event_params)
        @event = current_user.events.create(event_params)
        if @event.errors.any?
            render json: @event.errors, status: :unprocessable_entity
        else
            render json: @event, status: 201
        end
    end
      
      def show
          render json: @event.transform_event
      end

    def update
        # @event = Event.find(params[:id])
        @event.update(event_params)

        if @event.errors.any?
            render json: @event.errors, status: :unprocessable_entity
        else
            render json: @event, status: 201
        end
    end

    def destroy
        @event.delete
        render json: {event: "event deleted"}, status: 204
    end

    # def my_events
    #     @events = []
    #     Event.find_by_user(current_user.username).order('updated_at DESC').each do |event|
    #         @events << event.find_by(id: event.id).transform_event
    #     end
    #     render json: @events
    # end
    private
    def find_event
        begin
            @event = Event.find(params[:id])
        rescue
            render json: {error: "event does not exist"}, status: 404
        end
    end

    def check_ownership
        if !current_user.admin
            if current_user.id != @event.user.id
                render json: {error: "unauthorized action"}, status: 401
            end
        end
    end
 
    def event_params
        params.require(:event).permit(:name, :description, :date, :attendees, :location, :time, :contact_name, :contact_phone)
    end
end



# class EventsController < ApplicationController
#    before_action :authenticate_user, except: [:index, :show] 
#     before_action :find_event, only: [:show, :update, :destroy]
#     before_action :check_ownership, only: [:destroy, :update] 
    
#    def index
#       @events = Event.all
#       render json: @events
#    end

#    def show
#       render json: @event
#    end 

#     def find_event
#         begin
#             @event = Event.find(params[:id])
#         rescue
#             render json: {error: "Event does not exist"}, status: 404
#         end
#     end

#    def create
#       @Event = Event.create(event_params)

#       if @event.save
#          render json: @event, status: :created
#       else 
#          render json: @event.errors, status: :unprocessable_entity
#       end
#    end

#    def update
#       @event = Event.find(params[:id])
#       if @event.update(event_params)
#          render json: @event
#       else
#          render json: @event.errors, status: :unprocessable_entity
#       end
#    end

#    def destroy
#       @event = Event.find(params[:id])
#       @event.destroy
#    end

#    ######################################################

#    private
#    def event_params
#       params.permit(:name, :description, :date, :attendees, :location, :time, :contact_name, :contact_phone)
#    end

# end

