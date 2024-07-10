class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[ show edit update destroy ]

  def index
    @interviews = Interview.all
  end

  def show
  end

  def new
    @interview = Interview.new
    @default_position = "SE"
    @candidate_position_test 
    if params[:interview] && params[:interview][:position]
      @default_position = params[:interview][:position]
      puts "Position: #{params[:interview][:position]}"
      @candidate_position_test = CandidatePositionTest.where(result: "pass").joins(:candidate).select('candidate_position_tests.*, candidates.name AS candidate_name')
      @candidate_position_test = @candidate_position_test.where(position_id: Position.where(title: params[:interview][:position]))
    end
    puts @candidate_position_test.inspect
  end

  def edit
  end

  def create
    @interview = Interview.new(interview_params)


    respond_to do |format|
      if @interview.save
        format.html { redirect_to interview_url(@interview), notice: "Interview was successfully created." }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to interview_url(@interview), notice: "Interview was successfully updated." }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @interview.destroy
    redirect_to interviews_path
  end

  private

    def set_interview
      @interview = Interview.find(params[:id])
    end

    def interview_params
      params.require(:interview).permit(:candidate_position_test_id, :interviewer, :interview_type,:result)
    end
end
