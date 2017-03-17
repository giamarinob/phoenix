class MembersController < ApplicationController
	before_action :logged_in
	before_action :admin, except: [:show]


	def index
		@members = Member.all()
	end

	def create
		@member = Member.new(member_params)
		if @member.save
			log_in(@member)
			redirect_to home_path
		else
			@errors = @member.errors.full_messages
			render 'new'
		end
	end

	def new
	end

	def edit
		@member = Member.find(params[:id])
	end

	def show
		@member = Member.find(params[:id])
		unless @member.id == current_user.id || current_user.is_admin
			redirect_to home_path
		end
	end

	def update
		@member = Member.find(params[:id])
		@errors = Array.new
		puts params[:id]
		if params[:newPass1] 
			if params[:newPass2] && params[:newPass1] == params[:newPass2]
				if params[:password]
					if @member.authenticate(:password)
						params[:password] = params[:newPass1]
					else
						@errors.push("You Entered Your Current Password Incorrectly")
						render 'edit'
					end
				else
					@errors.push("Please Enter Your Current Password To Edit Your Profile")
					render 'edit'
				end
			else
				@errors.push("Your New Passwords Do Not Match")
				render 'edit'
			end
		elsif params[:password]
			if !@member.authenticate(params[:password])
				@errors.push("Please Enter Your Current Password To Update Your Profile")
			end
		end

		@member.update(member_params)
		if @member.save
			redirect_to members_path
		else
			@errors = @member.errors.full_messages
			render 'edit'
		end
	end

	def destory
		Member.find(params[:id]).destroy
		redirect_to members_path
	end

	private

	def member_params
		params.require(:member).permit(:email, :name, :password, :is_admin)
	end

	def log_in(member)
		session[:member_id] = member.id
	end
end