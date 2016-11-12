function milestones(){
	positionMilestones();
	assignMilestoneMarkerClick();

    
    function assignMilestoneMarkerClick(){
    	$('.milestone-marker').click(function(){
	        
	    });
    };
    
    function positionMilestones(){
		var milestoneMarkers = $("span.milestone-marker");
		var milestoneIndex;
		for (milestoneIndex = 0; milestoneIndex < milestoneMarkers.length; milestoneIndex++){
			var milestone = milestoneMarkers[milestoneIndex];
			milestone.style.left = Math.ceil(((milestoneIndex + 1) / (milestoneMarkers.length + 1)) * 100) + "%";
		}
	};
};



