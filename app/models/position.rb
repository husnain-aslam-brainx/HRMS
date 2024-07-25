class Position < ApplicationRecord
    scope :by_title, ->(title) { find_by(title: title) }
    has_many :candidate_position_tests
    enum :title ,[:SE, :SQA]
    enum :status, [:open, :close]
end