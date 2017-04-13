class User < ActiveRecord::Base


  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :email,
            presence: true,
            length: {maximum: 50},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 88}

  #test user -> email: gogo@yahoo.com -> pass: foo
  # user = User.find_by(email)
end
