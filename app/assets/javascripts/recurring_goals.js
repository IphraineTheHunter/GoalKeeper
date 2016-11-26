function recurringGoals(userId){
	var dailyButton = $(".daily.recurring-goals");
	$(".daily.select-goal-type").click(function(){switchToGoalType('daily');});
	$(".weekly.select-goal-type").click(function(){switchToGoalType('weekly');});
	$(".monthly.select-goal-type").click(function(){switchToGoalType('monthly');});

	$(".edit-button").click(function(){
		var goalCard = this.parentNode;
		if ( $(this).hasClass('active') ) {
			return;
		}
		$(this).addClass('active');

		var forms = $('.fubar');
		if( forms.length > 0 && forms[0].parentElement != this ){
			forms.remove();
			forms = $('.fubar');
		};
		if ( forms.length == 0 ){
			$.ajax({url: userId + '/recurring_goals/' + goalCard.id + '/updateForm',
				success: function(result){
					var formElement = document.createElement("div");
					formElement.innerHTML=result;
					$(goalCard).html(formElement);
				},
				cache: false,
				dataType: 'html'
			});
		};

	});

	$(".glyphicon-unchecked").click(function(){
		var goalCard = this.parentNode;
		$.ajax({type: "PATCH",
			url: userId + '/recurring_goals/' + goalCard.id,
			data: {id: goalCard.id, completed: true},
			success:{
			}
		})
		location.reload()

	});

	function switchToGoalType(goalType){
		$('.recurring-goals').addClass('hidden');
		$('.select-goal-type').removeClass('selected');
		$('.' + goalType).removeClass('hidden');
		$('.select-goal-type.' + goalType).addClass('selected');
	}
};

//http://stackoverflow.com/questions/17559563/sending-ajax-post-jquery-in-rails-application
