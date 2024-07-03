class RenameTypeColumnInInterviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :interviews, :type, :interview_type
  end
end
