module ApplicationHelper

	def full_title(page_title = '')
		base_title = 'Washinkai Shanghai Aikido SyuFu Kan 和心会 · 上海合気道秋风馆'
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

end
