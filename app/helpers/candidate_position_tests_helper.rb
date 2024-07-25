module CandidatePositionTestsHelper
    def candidates_options
        options_from_collection_for_select( Candidate.all.order("created_at"),:id,:name)
    end
    def positions_options
        options_from_collection_for_select(Position.all.order("created_at").uniq, :id, :title)
    end
    def tests_options
        options_from_collection_for_select(Test.all.order("created_at"), :id,:description)
    end
end