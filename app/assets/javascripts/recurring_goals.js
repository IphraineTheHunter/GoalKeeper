function recurringGoals(){
	var dailyButton = $(".daily.recurring-goals");
	$(".daily.select-goal-type").click(function(){switchToGoalType('daily');});
	$(".weekly.select-goal-type").click(function(){switchToGoalType('weekly');});
	$(".monthly.select-goal-type").click(function(){switchToGoalType('monthly');});

	
	
	function switchToGoalType(goalType){
		$('.recurring-goals').addClass('hidden');
		$('.select-goal-type').removeClass('selected');
		$('.' + goalType).removeClass('hidden');
		$('.select-goal-type.' + goalType).addClass('selected');
	}
};
