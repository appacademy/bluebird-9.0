# == Schema Information
#
# Table name: users
#
#  id                    :bigint(8)        not null, primary key
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  email                 :string           not null
#  age                   :integer          not null
#  political_affiliation :string
#  password_digest       :string           not null
#  session_token         :string           not null
#

class User < ApplicationRecord
  validates :username, :email, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :password_digest, presence: true

  after_initialize :ensure_session_token
  # before_validation :ensure_session_token

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def is_password?(password)
    # Convert string -> BCrypt Password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      return user
    end

    nil
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end













  has_many :chirps,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Chirp

  has_many :likes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Like

  has_many :liked_chirps,
    through: :likes,
    source: :chirp

  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment

end
