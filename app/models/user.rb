class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: { message: "The Name cannot be empty"},length: { maximum: 50, message: "The Name cannot be empty"}
	validates :email, presence: { message: "The Email cannot be empty"}, uniqueness: { case_sensitive: false, message: "The email has already been registered."} 
	validates :password, presence: { message: "The Password cannot be empty"}, length: { minimum: 6, message: "Password has at least six."}

	has_secure_password
	has_many :locations, dependent: :destroy


	def to_param
		name = self.name
		name.gsub!(/ /, '.')     
     "#{name}"
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
