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
		@calendar = Calendar.find(params[:id])
	end

	def update
		@calendar = Calendar.find(params[:id])

		@calendar.update(calendar_params)
		if @calendar.save
			redirect_to calendars_path
		else
			@errors = @calendar.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@calendar = Calendar.find(params[:id])
		@calendar.remove_calendar_file!
		@calendar.destroy
		redirect_to calendars_path
	end

	private
	  def calendar_params
	  	params.require(:calendar).permit(:month, :year, :calendar_file)
	  end
end