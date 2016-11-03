class AddGoalTypeToRecurringGoals < ActiveRecord::Migration
  def change
    add_column :recurring_goals, :goal_type, :string
  end
end
