class AddDataToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :due, :date
  end
end
