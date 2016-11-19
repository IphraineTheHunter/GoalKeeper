function addProgress(){

    $('.add-progress').click(function(){

    	var progressMarker = this;

		if ( $(this).hasClass('active') ) {
//			$(this).removeClass('active');
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
//	    			formElement.classList.add('milestone-form');
		        	formElement.innerHTML=result;
				    progressMarker.after(formElement);
    			},
    			cache: false,
    			dataType: 'html'
    		});
    	};
    });


    	$('.add-milestone').click(function(){

        	var newMilestone = this;

    		if ( $(this).hasClass('active') ) {
//    			$(this).removeClass('active');
    			return;
    		}
    		$(this).addClass('active');

        	var forms = $('.fubar');
        	if( forms.length > 0 && forms[0].parentElement != this ){
            	forms.remove();
            	forms = $('.fubar');
           	};
        	if ( forms.length == 0 ){
        		$.ajax({url: '/milestone_tracks/' + this.id + '/createForm' ,
        			success: function(result){
    	    			var formElement = document.createElement("div");
//    	    			formElement.classList.add('milestone-form');
    		        	formElement.innerHTML=result;
    				    newMilestone.after(formElement);
        			},
        			cache: false,
        			dataType: 'html'
        		});
        	};
        });
};
