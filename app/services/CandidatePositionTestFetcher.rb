class CandidatePositionTestFetcher
    def initialize(params)
      @params = params
    end

    def fetch 
        CandidatePositionTest.joins(:candidate, :position)
        .where(candidate_position_tests: {result: "pass"},positions: {title: @params})
        .select('candidate_position_tests.* , candidates.name AS candidate_name')
    end
end