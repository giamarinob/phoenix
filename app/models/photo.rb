class Photo < ActiveRecord::Base
	validates :photo_file, presence: true

	mount_uploader :photo_file, PhotoUploader
end