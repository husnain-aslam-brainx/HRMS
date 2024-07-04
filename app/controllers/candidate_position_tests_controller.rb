class CandidatePositionTestsController < ApplicationController
    def index
        @candidate_position_tests = CandidatePositionTest.all
    end
    def new 
        @candidate_position_test = CandidatePositionTest.new
        @candidates = Candidate.all
        @tests = Test.all
        @positions = Position.all
    end
    def create 
        @candidate_position_test = CandidatePositionTest.new(candidate_position_test_params)
        if @candidate_position_test.save
            redirect_to candidate_position_tests_path
        else
            render :new
        end
    end
    def edit 
        @candidate_position_test = CandidatePositionTest.find(params[:id])
    end
    def update 
        @candidate_position_test = CandidatePositionTest.find(params[:id])
        if @candidate_position_test.update(candidate_position_test_params)
            redirect_to candidate_position_tests_path
        else
            render :edit
        end
    end
    def destroy 
        @candidate_position_test = CandidatePositionTest.find(params[:id])
        @candidate_position_test.destroy
        redirect_to candidate_position_tests_path
    end

    def candidate_position_test_params
        params.require(:candidate_position_test).permit(:candidate_id, :test_id, :position_id, :status, :result)
    end
end