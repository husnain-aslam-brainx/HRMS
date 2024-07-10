class Candidate < ApplicationRecord
    has_one_attached :profile
    has_many_attached :resumes
    has_one :candidate_position_test
end