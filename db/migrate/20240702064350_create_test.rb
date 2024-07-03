class CreateTest < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :description

      t.timestamps
    end
  end
end
