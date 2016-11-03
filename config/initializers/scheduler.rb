#
# config/initializers/scheduler.rb

require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# task to reset daily goals one minute after midnight
# using a cron format
# one minute after midnight, every day, every month, and every day of the week
s.cron '1 0 * * *' do
   RecurringGoal.update_all(completed: "false")
end
