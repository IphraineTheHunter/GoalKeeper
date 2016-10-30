class AddRecurringGoals < ActiveRecord::Migration
  def change
    create_table :recurring_goals do |t|
      t.string :name
      t.boolean :completed
      t.integer :user_id
    end
  end
end
