class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password cannot be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.find_by_credentials(username, password)
    password_digest = BCrypt::Password.create(password)
    user = User.find_by { username: username, password_digest: password_digest}
    return user if user
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
