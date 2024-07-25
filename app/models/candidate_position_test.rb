class CandidatePositionTest < ApplicationRecord
    belongs_to :position
    belongs_to :test
    belongs_to :candidate
    has_many :interviews
    enum :status, [:assigned,:attempted]
    enum :result, [:pass,:fail]
end
