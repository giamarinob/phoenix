class SessionsController < ApplicationController
	def new
	end

	def create
		puts "I am attempting to log in"
		@member = Member.find_by_email(params[:session][:email])
		if @member && @member.authenticate(params[:session][:password])
			session[:member_id] = @member.id
			redirect_to home_path
		else
			@errors = "Login Authentication Failed"
			render 'new'
		end
	end

	def destroy
		session[:member_id] = nil
		redirect_to home_path
	end
end