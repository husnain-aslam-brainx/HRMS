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
        candidate = Candidate.find(candidate_position_test_params[:candidate])
        test = Test.find(candidate_position_test_params[:test])
        position = Position.find(candidate_position_test_params[:position])
        @candidate_position_test = CandidatePositionTest.create(candidate: candidate,test: test,position: position,status: candidate_position_test_params[:status],result: candidate_position_test_params[:result])
        if @candidate_position_test.save
            redirect_to candidate_position_tests_path
        else
            render :new
        end
    end
    def edit
        @candidate_position_test = CandidatePositionTest.find(params[:id])
        @candidates = Candidate.all
        @positions = Position.all
        @tests = Test.all
      end
    def update
        @candidate_position_test = CandidatePositionTest.find(params[:id])
        candidate = Candidate.find(candidate_position_test_params[:candidate])
        test = Test.find(candidate_position_test_params[:test])
        position = Position.find(candidate_position_test_params[:position])
        if @candidate_position_test.update(candidate: candidate,test: test,position: position,status: candidate_position_test_params[:status],result: candidate_position_test_params[:result])
            redirect_to candidate_position_tests_path
        else
          @candidates = Candidate.all
          @positions = Position.all
          @tests = Test.all
          render :edit
        end
    end
    def destroy 
        @candidate_position_test = CandidatePositionTest.find(params[:id])
        @candidate_position_test.destroy
        redirect_to candidate_position_tests_path
    end

    def candidate_position_test_params
        params.require(:candidate_position_test).permit(:candidate, :test, :position, :status, :result)
    end
end