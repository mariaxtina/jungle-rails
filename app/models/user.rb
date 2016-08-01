 class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def password_length?(password)
    password.length > 1
  end

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by email:email
    !!(user && user.authenticate(password))
  end
end
