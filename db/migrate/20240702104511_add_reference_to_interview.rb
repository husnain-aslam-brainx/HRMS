class AddReferenceToInterview < ActiveRecord::Migration[7.1]
  def change
    add_reference :interviews, :candidate_position_test, null: false, foreign_key: true
  end
end
