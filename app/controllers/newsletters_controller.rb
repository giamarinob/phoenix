class NewslettersController < ApplicationController
  before_action :admin, except: [:index]

	def index
		@newsletters = Newsletter.limit(3)
	end

	def new
	end

	def create
		@newsletter = Newsletter.new(newsletter_params)
		if @newsletter.save
			flash[:notice] = "Newletter Successfully Saved!"
			redirect_to newsletters_path
		else
			@errors = @newsletter.errors.full_messages
			render 'new'
		end
	end

	def edit
		@newsletter = Newsletter.find(params[:id])
	end

	def update
		@newsletter = Newsletter.find(params[:id])
		if params[:newsletter][:newsletter_file]
			@newsletter.remove_newsletter_file
		end
		@newsletter.update(newsletter_params)
		if @newsletter.save
			flash[:notice] = "Newletter Successfully Updated!"
			redirect_to newsletters_path
		else
			@errors = @newsletter.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@newsletter = Newsletter.find(params[:id])
		@newsletter.remove_newsletter_file!
		@newsletter.destroy
		redirect_to newsletters_path
	end

	private
	  def newsletter_params
	  	params.require(:newsletter).permit(:month, :year, :newsletter_file)
	  end
end