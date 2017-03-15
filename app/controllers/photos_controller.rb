class PhotosController < ApplicationController
  before_action :admin, except: [:index]

	def index
		@photos = Photo.all
	end

	def new
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			flash[:notice] = "Photo Successfully Saved"
			redirect_to photos_path
		else
			@errors = @photo.errors.full_messages
			render 'new'
		end
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		@photo.update(photo_params)
		if @photo.save
			flash[:notice] = "Photo Successfully Updated"
			redirect_to photos_path
		else
			@errors = @photo.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.remove_photo_file
		@photo.destroy
		redirect_to photos_path
	end

	private
	  def photo_params
	  	params.require(:photo).permit(:caption, :photo_file)
	  end
end