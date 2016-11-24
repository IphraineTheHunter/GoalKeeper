class AddProgressToMilestoneTracks < ActiveRecord::Migration
  def change
    add_column :milestone_tracks, :progress, :float
  end
end
