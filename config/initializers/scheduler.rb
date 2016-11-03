#
# config/initializers/scheduler.rb

require 'rufus-scheduler'

s = Rufus::Scheduler.new


# task to reset daily goals one minute after midnight
# using a cron format
# one minute after midnight, every day, every month, and every day of the week
s.cron '1 * * * *' do
   RecurringGoal.where(goal_type: 'Daily').find_each do |daily|
     daily.update(completed: "false")
   end
end

# task to reset weekly goals one minute after midnight on Monday
# using a cron format
# one minute after midnight, every day, every month, on Monday
# To clarify, it will be 12:01am Monday when this runs, so effectively
# it runs on Sunday night.
s.cron '1 * * * 1' do
   RecurringGoal.where(goal_type: 'Weekly').find_each do |weekly|
     weekly.update(completed: "false")
   end
end

# first minute after midnight on the first of every month
s.cron '1 0 1 * *' do
  RecurringGoal.where(goal_type: 'Monthly').find_each do |monthly|
    monthly.update(completed: "false")
  end
end
