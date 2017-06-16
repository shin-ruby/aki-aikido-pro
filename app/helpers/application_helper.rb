module ApplicationHelper

	def full_title(page_title = '')
		base_title = 'Shanghai Aikido 上海合气道秋风馆'
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

end
