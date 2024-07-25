class Candidate < ApplicationRecord
    has_one :candidate_position_test
    has_one_attached :profile
    has_many_attached :resumes
end