class RostersController < ApplicationController

    # method to retrieve all rosters

    def index
        @rosters = Roster.order(start_time: :asc).preload(:role, :rostered_tm)
    end

    # method to show individual rosters

    def show
        render json: @roster.transform_event
    end

    # method to build new roster and associated role
    def new
        @roster = Roster.new
        @roster.build_role
        @roster.build_rostered_tm
    end 

    # method to create new roster via grabbing roster params
    def create
        @roster = Roster.new(roster_params)
        respond_to do |format|
            if @roster.save
                format.html { redirect_to @roster, notice: "Roster was successfully created." }
                format.json { render :show, status: :created, location: @roster }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @roster.errors, status: :unprocessable_entity }
            end
        end
    end

    # updating roster and associated foreign key, role

    def update
        respond_to do |format|
          if @roster.update(roster_params)
            format.html { redirect_to @roster, notice: "Roster was successfully updated." }
            format.json { render :show, status: :ok, location: @roster }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @roster.errors, status: :unprocessable_entity }
          end
        end
    end

    # Destroying roster and associated foreign key, role

    def destroy
        @roster.destroy
        respond_to do |format|
            format.html { redirect_to rosters_url, notice: "Roster was successfully deleted." }
            format.json { head :no_content }
        end
    end

    private 

    # method for before_action callback to set Roster

    def set_roster
        @roster = Roster.find(params[:id])
    end 

    # Required params for Roster and foreign key Role attributes

    def roster_params
        params.require(:roster).permit(:start_time, :end_time, role_attributes: [:name], rostered_tm_attributes: [:first_name, :last_name])
    end 

end
