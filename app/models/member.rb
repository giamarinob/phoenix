class Member < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 5 }

	has_secure_password
end