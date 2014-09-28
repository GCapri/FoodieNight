# the methodss added to this helper will be available
# to all templates in the application; will be available in all views
module ApplicationHelper
  def format_time(time)
	time_str = time.getlocal.strftime("%m/%d/%Y %I:%M:%S %p")
	time_str.sub!(/^0/, '')
	return time_str.downcase!
  end
end
