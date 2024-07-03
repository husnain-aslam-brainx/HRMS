class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions do |t|
      t.string :description
      t.integer :name
      t.integer :status

      t.timestamps
    end
  end
end
