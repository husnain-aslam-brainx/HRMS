class Test < ApplicationRecord
    has_one_attached :assessment
    has_one :candidate_position_test
end
