class CandidatePositionTest < ApplicationRecord
    enum :status, [:assigned,:attempted]
    enum :result, [:pass,:fail]
    belongs_to :position
    belongs_to :test
    belongs_to :candidate
    has_many :interviews
end
