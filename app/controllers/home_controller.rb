class HomeController < ApplicationController
	before_action :admin, except: [:index]
	
	def index
		@newsletter = Newsletter.last
		@calendar = Calendar.last
		@announcement = Announcement.last
	end

	def mercury_update
		@announcement = Announcement.last
		@announcement.title = params[:content][:announcement_title][:value]
		@announcement.announcements = params[:content][:announcement_announcements][:value]

		@announcement.save!
		render text: ''
	end
end