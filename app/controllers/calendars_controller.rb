class CalendarsController < ApplicationController
	before_action :logged_in
	before_action :admin, except: [:index]

	def index
		@calendars = Calendar.limit(3)
	end

	def create
		@calendar = Calendar.new(calendar_params)
		if @calendar.save
			flash[:notice] = "Calendar Successfully Created"
			redirect_to calendars_path
		else
			flash[:error] = "Failed to save calendar"
			@errors = @calendar.errors.full_messages
			render 'new'
		end
	end

	def new
	end

	def edit
	end

	def update
	end

	def delete
	end

	private
	  def calendar_params
	  	params.require(:calendar).permit(:month, :year, :calendar_file)
	  end
end