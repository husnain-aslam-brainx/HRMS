class CreateInterview < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.integer :type
      t.string :interviewer
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
