function addProgress(){

    $('.add-progress').click(function(){

    	var milestoneMarker = this;

		if ( $(this).hasClass('active') ) {
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
    		$.ajax({url: '/milestone_tracks/' + this.id + '/updateProgress',
    			success: function(result){
	    			var formElement = document.createElement("div");
	    			formElement.classList.add('form-container');
		        	formElement.innerHTML=result;
				    milestoneMarker.appendChild(formElement);
    			},
    			cache: false,
    			dataType: 'html'
    		});
    	};
    });
};
