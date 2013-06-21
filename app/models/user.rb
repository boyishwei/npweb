class User < ActiveRecord::Base
  attr_accessible :address, :address2, :address3, :address4, :address5, :address6, :admin, :birthday, :class_id, :email, :password,:password_confirmation, :phonenum, :regtime, :username, :hiddenAuthCode
  has_many :addresses
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :username, presence: true, length: { maximum: 50 },uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :phonenum, presence: true, length: {is:11}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save :create_remember_token

  private
      def create_remember_token
          self.remember_token = SecureRandom.urlsafe_base64
      end
end
