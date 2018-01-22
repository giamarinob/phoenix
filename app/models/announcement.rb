class Announcement < ActiveRecord::Base
	validates :title, presence: true
	validates :announcements, presence: true

end