class CandidatePositionTestFetcher
    def initialize(position_title)
      @position_title = position_title
    end
  
    def fetch
      CandidatePositionTest.passed.for_position(@position_title).select('candidate_position_tests.*, candidates.name AS candidate_name')
    end
  end
  