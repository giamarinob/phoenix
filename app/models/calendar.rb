class Calendar < ActiveRecord::Base
	validates :month, :year, :calendar_file, presence: true

	mount_uploader :calendar_file, CalendarUploader
end