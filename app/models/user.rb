class User < ApplicationRecord
	
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :full_name, :location, :password
	validates_confirmation_of :password
	validates_length_of :bio, minimum: 3, allow_blank: false

	validate :email_format

	private

	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end

	has_secure_password
end
