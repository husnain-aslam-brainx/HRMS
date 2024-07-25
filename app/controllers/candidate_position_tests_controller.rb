class CandidatePositionTestsController < ApplicationController
    include CandidatePositionTestsHelper
    before_action :set_candidate_position_test, only: %i[edit update destroy]
  
    def index
      @candidate_position_tests = CandidatePositionTest.all.order(:created_at)
    end
  
    def new
      @candidate_position_test = CandidatePositionTest.new
    end
  
    def create
      @candidate_position_test = CandidatePositionTest.new(candidate_position_test_params)
      if @candidate_position_test.save
        redirect_to candidate_position_tests_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @candidate_position_test.update(candidate_position_test_params)
        redirect_to candidate_position_tests_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @candidate_position_test.destroy
      redirect_to candidate_position_tests_path
      else
        redirect_to candidate_position_tests_path, status: :unprocessable_entity
      end
    end
  
    private
  
    def candidate_position_test_params
      params.require(:candidate_position_test).permit(:candidate_id, :test_id, :position_id, :status, :result)
    end
  
    def set_candidate_position_test
      @candidate_position_test = CandidatePositionTest.find(params[:id])
    end
  end
  