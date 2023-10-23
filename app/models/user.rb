class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }

  # def authenticate_with_credentials(:email, :password)
    
  # end

end
