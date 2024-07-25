class PositionsController < ApplicationController
    before_action :set_position, only: %i[edit update destroy] 
    def index
        @positions = Position.all.order("created_at")
    end
    def new
        @position = Position.new
    end
    def create
        @position = Position.new(position_params)
        if @position.save 
            redirect_to positions_path, notice: "added"
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit 
    end
    def update 
        if @position.update(position_params)
            redirect_to positions_path, notice: "updated"
        else
            render :index, status: :unprocessable_entity
        end
    end
    def destroy
        if @position.destroy
        redirect_to positions_path, notice: "Position was successfully deleted."
        else
            redirect_to positions_path,   status: :unprocessable_entity
        end
    end

    private

    def position_params
        params.require(:position).permit(:description,:title,:status,:id)
    end
    def set_position
        @position = Position.find(params[:id])
    end
end