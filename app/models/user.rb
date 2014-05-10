class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

  #:username is the name used in the website, start with @, like @xuchu
  #:name is the true name, like Xuchu Zhang
  validates :username, uniqueness: { case_sensitive: false, message: "This username is already registered"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "The email cannot be empty"},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false, message: "This email is already registered."}

	validates :password, presence: { message: "The Password cannot be empty"},
            length: { minimum: 6, message: "Password must be at least 6 characters."}

	has_secure_password

  has_attached_file :avatar, :styles => { :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :avatar

	has_many :locations, dependent: :destroy

	def to_param
		self.username
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
