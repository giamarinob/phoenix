class AdminController < ApplicationController
	before_action :logged_in
	before_action :admin

	def index
	end
end