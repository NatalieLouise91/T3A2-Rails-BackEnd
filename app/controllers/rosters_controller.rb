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

        

        if params["0"]
        
            event_id_1 = params["0"]["event_id"]
            start_time_1 = params["0"]["start_time"]
            end_time_1 = params["0"]["end_time"]
            role_1 = params["0"]["role"]
            name_1 = params["0"]["name"]
            id_1 = params["id"]

            @roster = Roster.create(id: id_1.to_i, event_id: event_id_1.to_i, user_id: 1, start_time: start_time_1, end_time: end_time_1, role: role_1, name: name_1)
            @roster.save 
            if @roster.errors.any?
                render json: @roster.errors, status: :unprocessable_entity
            else
                render json: @roster, status: 201
            end

        elsif params["1"]

            event_id_2 = params["1"]["event_id"]
            start_time_2 = params["1"]["start_time"]
            end_time_2 = params["1"]["end_time"]
            role_2 = params["1"]["role"]
            name_2 = params["1"]["name"]
            id_2 = params["id"]

            @roster = Roster.create(id: id_2.to_i, event_id: event_id_2.to_i, user_id: 1, start_time: start_time_2, end_time: end_time_2, role: role_2, name: name_2)
            @roster.save 
            if @roster.errors.any?
                render json: @roster.errors, status: :unprocessable_entity
            else
                render json: @roster, status: 201
            end

        elsif params["2"]
            event_id_3 = params["2"]["event_id"]
            start_time_3 = params["2"]["start_time"]
            end_time_3 = params["2"]["end_time"]
            role_3 = params["2"]["role"]
            name_3 = params["2"]["name"]
            id_3 = params["id"]

            @roster = Roster.create(id: id_3.to_i, event_id: event_id_3.to_i, user_id: 1, start_time: start_time_3, end_time: end_time_3, role: role_3, name: name_3)
            @roster.save 
            if @roster.errors.any?
                render json: @roster.errors, status: :unprocessable_entity
            else
                render json: @roster, status: 201
            end
        end 
    end

    # updating roster and associated foreign key, role

    def update
        respond_to do |format|
          if @roster.update(roster_params)
            format.json { render :show, status: :ok, location: @roster }
          else
            format.json { render json: @roster.errors, status: :unprocessable_entity }
          end
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
