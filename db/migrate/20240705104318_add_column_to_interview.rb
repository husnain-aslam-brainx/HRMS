class AddColumnToInterview < ActiveRecord::Migration[7.1]
  def change
    add_column :interviews, :result, :integer
  end
end
