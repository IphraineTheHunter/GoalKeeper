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

	$(".goal").click(function(){
		var goalCard = this.parentNode;
		$.ajax({type: "PATCH",
			url: userId + '/recurring_goals/' + goalCard.id,
			data: {id: goalCard.id, completed: true},
			success:{
			}
		})
		setTimeout(location.reload(true), 2000)

	});

	$(".delete-button").click(function(){
		if (confirm('Are you sure you want to delete this goal?')) {
			var goalCard = this.parentNode;
			$.ajax({type: "PATCH",
				url: userId + '/recurring_goals/' + goalCard.id,
				data: {id: goalCard.id, remove: true},
				success:{
				}
			})
			setTimeout(location.reload(true), 2000)

		} else {
		    // we don't want to delete a goal
		}

	});

	function switchToGoalType(goalType){
		$('.recurring-goals').addClass('hidden');
		$('.select-goal-type').removeClass('selected');
		$('.' + goalType).removeClass('hidden');
		$('.select-goal-type.' + goalType).addClass('selected');
	}
};

//http://stackoverflow.com/questions/17559563/sending-ajax-post-jquery-in-rails-application
