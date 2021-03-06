class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,4}+\z/i
	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
	has_secure_password
	validates :password, length: {minimum: 6}
end
