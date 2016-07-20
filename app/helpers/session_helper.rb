module SessionHelper
	def current_user
		if logged_in?
			@current_user = Member.find(session[:member_id])
		end
	end

	def logged_in?
		session[:member_id] ? true : false
	end
end