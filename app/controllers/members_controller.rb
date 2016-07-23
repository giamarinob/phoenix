class MembersController < ApplicationController
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
	end

	def update
		@member = Member.find(params[:id])
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
end