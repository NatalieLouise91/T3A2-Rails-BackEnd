class RostersController < ApplicationController
    # before_action :authenticate_user, except: [:index, :show] 
    # before_action :find_roster, only: [:show, :update, :destroy]
    # before_action :check_admin, only: [:destroy, :update, :create] 

    # method to retrieve all rosters

    def index
        @rosters = Roster.order(start_time: :asc)
        render json: @rosters
    end

    # method to show individual rosters

    def show
        @roster = Roster.find(params[:id])
        render json: @roster    
        # .transform_roster
    end

    # method to create new roster

    def new
        @roster = Roster.new
    end

    # method to create new roster via grabbing roster params
    def create

        event_id = params["event_id"]
        start_time = params["start_time"]
        end_time = params["end_time"]
        role = params["role"]
        name = params["name"]
        id = params["id"]

        @roster = Roster.create(id: id.to_i, event_id: event_id.to_i, user_id: 1, start_time: start_time, end_time: end_time, role: role, name: name)
        @roster.save

        if @roster.errors.any?
            render json: @roster.errors, status: :unprocessable_entity
        else
            render json: @roster, status: 201
        end
    end

    # updating roster and associated foreign key, role

    def update
        @roster = Roster.find_by_id(params[:id])
        @roster.event_id = params[:event_id]
        @roster.name = params[:name]
        @roster.role = params[:role]
        @roster.start_time = params[:start_time]
        @roster.end_time = params[:end_time]
        @roster.user_id = 1

        @roster.save

        if @roster
            render json:{msg: "Roster has been successfully updated"}, status: 200
        else
            render json:{msg: "Unable to update the selected roster"}
        end
    end

    # Destroying roster and associated foreign key, role

    def destroy
        @roster = Roster.find_by_id(params[:id])
        if @roster
          @roster.destroy
          render json: @roster, status: 201
        end  
    end

    private 

    # method for before_action callback to set Roster

    def set_roster
        @roster = Roster.find(params[:id])
    end 

    # Required params for Roster

    def roster_params
        params.require(:roster).permit(:id, :event_id, :start_time, :end_time, :role, :name)
    end 

end
