window.onload = function(){
	var dailyButton = $(".daily.recurring-goals");
	$(".daily.select-goal-type").click(function(){switchToGoalType('daily');});
	$(".weekly.select-goal-type").click(function(){switchToGoalType('weekly');});
	$(".monthly.select-goal-type").click(function(){switchToGoalType('montly');});

	
	
	function switchToGoalType(goalType){
		$('.recurring-goals').addClass('hidden');
		$('.' + goalType).removeClass('hidden');
	}
};
