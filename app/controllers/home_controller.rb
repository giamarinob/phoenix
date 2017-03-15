class HomeController < ApplicationController
	def index
		@newsletter = Newsletter.last
		@calendar = Calendar.last
	end
end