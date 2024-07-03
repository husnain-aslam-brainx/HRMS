class Position < ApplicationRecord
    enum :title ,[:SE, :SQA]
    enum :status, [:open, :close]
    has_many :candidate_position_tests
end