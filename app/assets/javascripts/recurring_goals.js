function recurringGoals(userId){
	var dailyButton = $(".daily.recurring-goals");
	$(".daily.select-goal-type").click(function(){switchToGoalType('daily');});
	$(".weekly.select-goal-type").click(function(){switchToGoalType('weekly');});
	$(".monthly.select-goal-type").click(function(){switchToGoalType('monthly');});

	$(".edit-button").click(function(){
		var goalCard = this.parentNode;
		var value = goalCard.querySelector('h4').innerHTML;
		goalCard.innerHTML =
		"<form action='" + userId + "/recurring_goals/" + goalCard.id + "'>" +
			"<input type='hidden' name='_method' value='PUT'>" +
			"<label>Goal name</label>" +
			"<input type='text' value='" + value + "' name='name' ></input>" +
			"<input type='submit' value='Save'/>" +
		"</form>";

	});

	function switchToGoalType(goalType){
		$('.recurring-goals').addClass('hidden');
		$('.select-goal-type').removeClass('selected');
		$('.' + goalType).removeClass('hidden');
		$('.select-goal-type.' + goalType).addClass('selected');
	}
};
