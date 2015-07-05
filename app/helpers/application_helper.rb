module ApplicationHelper

	def list_users(users)
		out = "<ul>"
		@users.each do |user|
			out += "<li>"
			out += "#{user.fname} #{user.lname} &ndash;"
			out += link_to("Delete User", user_path(user.id), method: :delete)
			out += "</li>"
		end

		out += "</ul>".html_safe
		return out.html_safe
	end
end
