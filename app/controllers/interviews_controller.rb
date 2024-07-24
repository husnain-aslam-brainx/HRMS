class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[show edit update destroy]

  def index
    @interviews = Interview.all.order("created_at")
  end

  def show
  end

  def new
    @interview = Interview.new
    @selected_position = params[:interview][:position].present? ? params[:interview][:position] : Position.first.title
    @candidate_position_tests = CandidatePositionTestFetcher.new(@selected_position).fetch
  end

  def edit
    @selected_position = @interview.candidate_position_test&.position&.title
    @candidate_position_tests = CandidatePositionTestFetcher.new(@selected_position).fetch
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to interviews_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @interview.update(interview_params)
      redirect_to interviews_path
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    if @interview.destroy
      redirect_to interviews_path
    else
      redirect_to interviews_path, status: :unprocessable_entity
    end
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:candidate_position_test_id, :interviewer, :interview_type, :result)
  end

  def set_candidate_position_tests

  end
end
