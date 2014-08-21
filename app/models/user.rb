class User < ActiveRecord::Base
  has_secure_password
  has_many :microposts, dependent: :destroy
  validates :name, :email, presence: true
  validates :name, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  before_save { email.downcase! }
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def feed
    Micropost.where("user_id = ?", id)
  end
  

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end


end
