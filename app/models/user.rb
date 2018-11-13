# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  location_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# FRIPE
# F = find_by_credentials(username, password)
# G = generate_session_token
# R = reset_session_token!
# I = is_password(password)
# P = password=(password)
# E = ensure_session_token

class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  # validations call getter methods for each attribute
  # since password isn't a column, we need to create a getter method for it
  attr_reader :password

  has_many :twists,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :Twist

  belongs_to :location,
    foreign_key: :location_id,
    primary_key: :id,
    class_name: :Location,
    optional: true

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) # could be a user, could be nil
    return nil unless user && user.is_password?(password) # is_password? only executes if user is a User object, not nil
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    # `create` takes a plaintext password, hashes and salts it and spits out a digest
  end

  def reset_session_token!
    # remember to not only generate a new session token, but also to save it to the database
    # this will not work if you don't save to the database
    self.update!(session_token: self.class.generate_session_token)
    # return the new token for convenience
    self.session_token
  end

  def is_password?(password)
    # password_digest is just a string
    # convert it into a BCrypt::Password object so that we can call #is_password? on it
    bcrypt_password = BCrypt::Password.new(self.password_digest) # just turns it into a Password object, doesn't hash it again
    bcrypt_password.is_password?(password) # this is_password? is a different method entirely
  end

  private

  def ensure_session_token
    # this will run whenever we instantiate a User object
    # that could happen because we're creating a new record,
    # or because we pulled one out of the database
    # that's why we use conditional assignment
    self.session_token ||= self.class.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64 # a random base64 number/string
  end
end
