function positionMilestones(){
	var milestoneTracks = $(".milestone-track");
	$.each(milestoneTracks, function(i, track){
		var milestoneMarkers = $(".milestone-marker", track);
		var milestoneIndex;
		for (milestoneIndex = 0; milestoneIndex < milestoneMarkers.length; milestoneIndex++){
			var milestone = milestoneMarkers[milestoneIndex];
			milestone.style.left = Math.ceil(((milestoneIndex + 1) / (milestoneMarkers.length + 1)) * 100) + "%";
		}
	});
};
