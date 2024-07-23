class TestsController < ApplicationController 
    before_action :set_test, only: %i[edit update destroy]
    def index 
        @tests = Test.all.order("created_at")
    end
    def new  
        @test = Test.new
    end
    def create 
        @test = Test.new(test_params)
        if @test.save 
            redirect_to tests_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit 
    end
    def update 
        if test_params[:assessment].present?
            update_test(test_params)
        else
            update_test(test_params.except(:assessment))
        end
    end
    def destroy 
        if @test.destroy
            redirect_to tests_path
        else
            redirect_to  tests_path, status: :unprocessable_entity
        end
    end
    
    private

    def test_params
        params.require(:test).permit(:description,:assessment)
    end
    def set_test
        @test = Test.find(params[:id])
    end
    def update_test(params)
        if @test.update(params)
            redirect_to tests_path
        else 
            render :edit, status: :unprocessable_entity
end
