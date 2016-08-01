 class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def password_length?(password)
    password.length > 1
  end

  def self.authenticate_with_credentials(email, password)
    user = User.where("LOWER(email)=?", email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      false
    end
  end
end
