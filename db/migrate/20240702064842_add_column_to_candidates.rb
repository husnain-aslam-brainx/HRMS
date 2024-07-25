class AddColumnToCandidates < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :name, :string
    add_column :candidates, :email, :string
    add_column :candidates, :address, :string
    add_column :candidates, :phone, :string
  end
end
