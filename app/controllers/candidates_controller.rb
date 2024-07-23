class CandidatesController < ApplicationController
    before_action :set_candidate, only: %i[show edit update destroy]
    def index
        @candidates = Candidate.all.order("created_at")
    end
    def show 
    end
    def new
        @candidate = Candidate.new
    end
    def create
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            redirect_to candidates_path
        else 
            render :new, status: :unprocessable_entity
        end 
    end
    def edit
    end
    def update
        if candidate_params[:resumes].present?
            update_candidate(candidate_params)
        else
            update_candidate(candidate_params.except(:resumes))
        end
    end
    def destroy 
        if @candidate.destroy
            redirect_to candidates_path
        else
            redirect_to candidates_path ,status: :unprocessable_entity
        end
    end

    private

    def candidate_params
        params.require(:candidate).permit(:name,:email,:address,:phone,:profile,resumes: [])
    end
    def set_candidate
        @candidate = Candidate.find(params[:id])
    end
    def update_candidate(params)
        if @candidate.update(params)
            redirect_to candidates_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

end
