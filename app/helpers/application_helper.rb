module ApplicationHelper
	def set_active(path)
		current_page?(path) ? 'active text-white' : ''
	end
end
