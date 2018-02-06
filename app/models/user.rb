class User < ApplicationRecord

	# before_save { self.email = self.email.downcase } # peut s'écrire (Ruby comprend que le 'self' est implicite ... sauf pour l'affectation elle-même ;)
  # before_save { self.email = email.downcase } # to be sure we store ONLY emails with lower case characters ! (= no mismatch due to case snsitivity)
  before_save { email.downcase! } # autre notation supportée par Ruby/Rails ... encore plus courte !
  validates :username,  presence: true, length: { maximum: 42 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false } # because emails are note case sensitives !
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


end
