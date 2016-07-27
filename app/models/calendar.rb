class Calendar < ActiveRecord::Base
	validates :month, :year, presence: true

	mount_uploader :calendar_file, CalendarUploader
end