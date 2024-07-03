class Test < ApplicationRecord
    has_one_attached :assesment
    has_one :candidate_position_test
end
