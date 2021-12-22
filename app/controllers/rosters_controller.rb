class RostersController < ApplicationController

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

    # method to build new roster and associated role
    def new
        @roster = Roster.new
    end 

    # method to create new roster via grabbing roster params
    def create
        @roster = Roster.new(roster_params)
        respond_to do |format|
            if @roster.save
                format.json { render :show, status: :created, location: @roster }
            else
                format.json { render json: @roster.errors, status: :unprocessable_entity }
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
        @roster.destroy
        respond_to do |format|
            format.json { head :no_content }
        end
    end

    private 

    # method for before_action callback to set Roster

    def set_roster
        @roster = Roster.find(params[:id])
    end 

    # Required params for Roster

    def roster_params
        params.require(:roster).permit(:event_id, :start_time, :end_time, :role, :name)
    end 

end
