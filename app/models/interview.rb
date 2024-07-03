class Interview < ApplicationRecord
    enum :interview_type, [:initial , :final]
    belongs_to :candidate_position_test
end
