function milestones(){
    $('.milestone_icon').click(function(){
        // hide the info for all the milestones for this track
        track = $(this.parentNode);
        track.find('milestone').addClass('hidden');

        track.find('span').removeClass('glyphicon glyphicon-flag btn-lg');
        track.find('span').addClass('glyphicon glyphicon-flag btn-lg');


        milestoneInfo = $(this);
        showMilestoneInfo(milestoneInfo);
    });


    function showMilestoneInfo(milestoneInfo){
        milestoneInfo.find('span').removeClass('glyphicon glyphicon-flag btn-lg');
        milestoneInfo.find('span').addClass('glyphicon glyphicon-plus btn-lg');
        milestoneInfo.find('milestone').removeClass('hidden');
    }
}
