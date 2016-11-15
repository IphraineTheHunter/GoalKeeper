function milestones(){
	positionMilestones();
	assignMilestoneMarkerClick();

    $('.milestone-marker').click(function(){

    	var milestoneMarker = this;

		// Stop Propagation was flakey on me, so I added this to it to
		// get around it's tempermental issues.
		// If I edited the controller or the layouts at all, then
		// stopPropagation wouldn't function as intended.
		// Adding the class "active" and bailing if it's already been
		// appended works regardless of any changes.
		if ( $(this).hasClass('active') ) {
			$(".form-container").remove();
			$(this).removeClass('active');
			return;
		}
		$(this).addClass('active');

    	var forms = $('.fubar');
    	if( forms.length > 0 && forms[0].parentElement != this ){
        	forms.remove();
        	forms = $('.fubar');
       	};
    	if ( forms.length == 0 ){
    		$.ajax({url: '/milestones/' + this.id + '/updateForm',
    			success: function(result){
	    			var formElement = document.createElement("div");
	    			formElement.classList.add('form-container');
		        	formElement.innerHTML=result;
				    milestoneMarker.appendChild(formElement);
//				    $('.form-container').on('click', function(event){
//				    	event.stopPropagation();
//				    });
    			},
    			cache: false,
    			dataType: 'html'
    		});
    	};
    });

    function assignMilestoneMarkerClick(){

    };

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
};
