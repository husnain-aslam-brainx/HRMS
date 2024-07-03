class CreateCandidatePositionTest < ActiveRecord::Migration[7.1]
  def change
    create_table :candidate_position_tests do |t|
      t.integer :status
      t.integer :result
      t.references :candidate
      t.references :test
      t.references :position

      t.timestamps
    end
  end
end
