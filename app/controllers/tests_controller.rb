class TestsController < ApplicationController 
    before_action :authenticate_user!
    def index 
        @tests = Test.all 
    end
    def new  
        @test = Test.new
    end
    def create 
        @test = Test.new(test_params)
        if @test.save 
            redirect_to tests_path
        else
            render :new
        end
    end
    def edit 
        @test = Test.find(params[:id])
    end
    def update 
        @test = Test.find(params[:id])
        if @test.update(test_params)
            redirect_to tests_path
        else
            render :edit
        end
    end
    def destroy 
        @test = Test.find(params[:id])
        @test.destroy
        redirect_to tests_path
    end
    
    def test_params
        params.require(:test).permit(:description,:assessment)
    end
end
