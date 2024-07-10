class CandidatesController < ApplicationController
    before_action :authenticate_user!
    def index
        @candidates = Candidate.all
    end
    def show 
        @candidate = Candidate.find(params[:id])
    end
    def new
        @candidate = Candidate.new
    end
    def create
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            if params[:candidate][:resumes]
                params[:candidate][:resumes].each do |resume|
                  @candidate.resumes.attach(resume)
                end
            end
            redirect_to candidates_path
        else 
            render :new
        end 
    end
    def edit
        @candidate = Candidate.find(params[:id])
    end
    def update
        @candidate = Candidate.find(params[:id])
        if @candidate.update(candidate_params)
            redirect_to candidates_path
        else 
            render :edit
        end
    end
    def destroy 
        @candidate = Candidate.find(params[:id])
        @candidate.resumes.each do |resume|
            resume.purge # This deletes the file from storage
        end
        if @candidate.destroy
            redirect_to candidates_path
        end
    end

    def candidate_params
        params.require(:candidate).permit(:name,:email,:address,:phone,:profile)
    end
end
