class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :name, presence: { message: "The Name cannot be empty"},length: { maximum: 50, message: "The Name cannot be empty"}
	validates :email, presence: { message: "The Email cannot be empty"}, uniqueness: { case_sensitive: false, message: "The email has already been registered."} 
	validates :password, presence: { message: "The Password cannot be empty"}, length: { minimum: 6, message: "Password has at least six."}

	has_secure_password
	has_many :locations, dependent: :destroy

end
