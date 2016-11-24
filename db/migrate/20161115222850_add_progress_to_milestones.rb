class AddProgressToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :progress, :float
  end
end
