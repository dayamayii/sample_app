class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true 
	VALID_EMAIL_REGEX = /\A^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: { minimum: 6 }
end
