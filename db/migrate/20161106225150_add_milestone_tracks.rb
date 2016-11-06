class AddMilestoneTracks < ActiveRecord::Migration
  def change
    create_table :milestone_tracks do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
