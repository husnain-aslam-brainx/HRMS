class RemoveReferenceFromInterview < ActiveRecord::Migration[7.1]
  def change
    remove_reference :interviews, :position, null: false
    remove_reference :interviews, :test, null: false
    remove_reference :interviews, :candidate, null: false
  end
end
