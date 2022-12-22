module ApplicationHelper

	def time_ago time 
		"#{time_ago_in_words(time)} ago"
	end

	def status_converter status, truthy: "Yes", falsey: "No"
		if status
			truthy
		else
			falsey
		end
	end

end
