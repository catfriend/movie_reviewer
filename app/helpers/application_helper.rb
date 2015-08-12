module ApplicationHelper
	def page_title
		if content_for?(:title)
			"Catfriend on Movies - #{content_for(:title)}"
		else
			"Catfriend on Movies"
		end
	end
end
