class User < ApplicationRecord
	has_secure_password
	
	has_many :posts
	# validates :firstname, :lastname, :email, :password_digest, presence: true
	# validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } ,acceptance: { message: 'must use valid email' }
end
