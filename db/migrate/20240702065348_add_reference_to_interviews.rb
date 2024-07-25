class AddReferenceToInterviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :interviews, :position, null: false, foreign_key: true
    add_reference :interviews, :candidate, null: false, foreign_key: true
  end
end
