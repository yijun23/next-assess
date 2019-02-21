class User < ApplicationRecord
  has_secure_password
  has_many :games
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  #Valid email format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_many :authentications, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end
 
  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end
end