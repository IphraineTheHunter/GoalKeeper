class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.boolean :completed
      t.integer :track_id
    end
  end
end
