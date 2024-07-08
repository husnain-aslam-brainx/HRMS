class Interview < ApplicationRecord
    enum :interview_type, [:initial , :final]
    enum :result, [:passed, :failed]
    belongs_to :candidate_position_test
end
