class PositionsController < ApplicationController
    before_action :authenticate_user!
    def index
        @positions = Position.all
    end
    def new
        @position = Position.new
    end
    def create
        @position = Position.new(position_params)
        if @position.save 
            redirect_to positions_path, notice: "added"
        else
            render :new
        end
    end
    def edit 
        @position = Position.find(params[:id])
    end
    def update 
        @position = Position.find(params[:id])
        if @position.update(position_params)
            redirect_to positions_path, notice: "updated"
        else
            render :index
        end
    end
    def destroy
        @position = Position.find(params[:id])
        @position.destroy
        redirect_to positions_path, notice: "Position was successfully deleted."
    end

    def position_params
        params.require(:position).permit(:description,:title,:status,:id)
    end
end