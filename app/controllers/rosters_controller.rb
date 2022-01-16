class RostersController < ApplicationController
    before_action :authenticate_user, except: [:index, :show] 
    before_action :find_roster, only: [:show, :update, :destroy]
    before_action :check_admin, only: [:destroy, :update, :create] 

    # method to retrieve all rosters

    def index
        @rosters = Roster.order(name: :asc)
        render json: @rosters
    end

    # method to show individual rosters

    def show
        @roster = Roster.find(params[:id])
        render json: @roster
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
        user_id = params["user_id"]
        author = params["author"]

        @roster = Roster.create(id: id.to_i, event_id: event_id.to_i, user_id: user_id.to_i, start_time: start_time, end_time: end_time, role: role, name: name, author: author)
        @roster.save

        if @roster.errors.any?
            render json: @roster.errors, status: :unprocessable_entity
        else
            render json: @roster, status: 201
        end
    end

    # method to update a roster

    def update
        @roster = Roster.find_by_id(params[:id])
        @roster.event_id = params[:event_id]
        @roster.name = params[:name]
        @roster.role = params[:role]
        @roster.start_time = params[:start_time]
        @roster.end_time = params[:end_time]
        @roster.author = params[:author]
        @roster.user_id = params[:user_id]

        @roster.save

        if @roster
            render json:{msg: "Roster has been successfully updated"}, status: 200
        else
            render json:{msg: "Unable to update the selected roster"}
        end
    end

    # Destroying roster by finding by id in params

    def destroy
        @roster = Roster.find_by_id(params[:id])
        if @roster
          @roster.destroy
          render json: @roster, status: 201
        end  
    end

    private 

    # method for before_action callback to find Roster 

    def find_roster
        begin
            @roster = Roster.find(params[:id])
        rescue
            render json: {error: "event does not exist"}, status: 404
        end
    end

    # method for before_action callback to check admin

    def check_admin
            if !current_user.admin
                render json: {error: "unauthorized action"}, status: 401
            end
    end

    # Required params for Roster

    def roster_params
        params.require(:roster).permit(:id, :event_id, :start_time, :end_time, :role, :name, :author)
    end 

end