class Interview < ApplicationRecord
    scope :passed, ->{where(result: "passed")}
    scope :for_position, ->(position_title){joins(position).where(positions: {title: position_title})}

    enum :interview_type, [:initial , :final]
    enum :result, [:passed, :failed]
    belongs_to :candidate_position_test
end
