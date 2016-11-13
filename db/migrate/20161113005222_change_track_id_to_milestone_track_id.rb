class ChangeTrackIdToMilestoneTrackId < ActiveRecord::Migration
  def change
    rename_column :milestones, :track_id, :milestone_track_id
  end
end
