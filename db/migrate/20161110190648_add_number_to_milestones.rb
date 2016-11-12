class AddNumberToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :number, :integer
  end
end
