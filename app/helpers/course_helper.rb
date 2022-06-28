module CourseHelper
	def set_check_box(checked)
		checked ? 'fa-solid fa-square-check fa-lg' : 'fa-regular fa-square-full borders'
	end

	def set_collapse_exhibit(size)
		size > 1 ? 'show' : ''
	end
end