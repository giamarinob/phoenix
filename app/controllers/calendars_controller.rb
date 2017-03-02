class CalendarsController < ApplicationController
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
		#if a new file is being uploaded, remove the old file before saving the new one
    if params[:calendar][:calendar_file]
			@calendar.remove_calendar_file
		end

		@calendar.update(calendar_params)
		if @calendar.save
			flash[:notice] = "Calendar Succesfully Updated!"
			redirect_to calendars_path
		else
			@errors = @calendar.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		#find the calendar
		@calendar = Calendar.find(params[:id])
		#remove the file associated with the record
		@calendar.remove_calendar_file!
		#remove record only after removing the file
		@calendar.destroy
		#stay on calendar index
		redirect_to calendars_path
	end

	private
	  def calendar_params
	  	params.require(:calendar).permit(:month, :year, :calendar_file)
	  end
end