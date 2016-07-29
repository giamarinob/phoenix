class Newsletter < ActiveRecord::Base
	validates :month, :year, :newsletter_file, presence: true

	mount_uploader :newsletter_file, NewsletterUploader
end