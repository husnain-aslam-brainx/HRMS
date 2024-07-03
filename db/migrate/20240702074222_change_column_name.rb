class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :positions, :name, :title
  end
end
