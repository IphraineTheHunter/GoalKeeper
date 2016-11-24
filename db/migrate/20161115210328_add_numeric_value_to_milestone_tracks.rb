class AddNumericValueToMilestoneTracks < ActiveRecord::Migration
  def change
    add_column :milestone_tracks, :numeric_value, :float
  end
end
