class Candidate < ApplicationRecord
    has_one_attached :profile
    has_one_attached :resume
    has_one :candidate_position_test
end