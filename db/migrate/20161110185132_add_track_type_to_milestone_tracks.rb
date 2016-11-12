class AddTrackTypeToMilestoneTracks < ActiveRecord::Migration
  def change
    add_column :milestone_tracks, :track_type, :string
  end
end
