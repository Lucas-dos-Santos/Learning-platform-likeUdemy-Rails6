module ApplicationHelper
	include Pagy::Frontend

	def set_active(path)
		current_page?(path) ? 'active text-dark' : ''
	end

	def title_head(title)
		title.nil? ? 'Online Courses - Learn Anything, On Your Schedule | Udemy - Clone' : title
	end
end
