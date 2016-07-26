class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def logged_in
		if !session[:member_id] 
			redirect_to login_path
		end
	end

  def current_user
		if session[:member_id]
			@current_user = Member.find(session[:member_id])
		end
	end

  def admin
  	unless current_user && current_user.is_admin
  		redirect_to home_path
  	end
  end
  
end
