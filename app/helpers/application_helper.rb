module ApplicationHelper
	include Pagy::Frontend

	def set_active(path)
		current_page?(path) ? 'active text-dark' : ''
	end
end
