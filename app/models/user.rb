class User < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

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
  validates :password, presence: true, confirmation: true, length: {minimum: 6, maximum: 88}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
