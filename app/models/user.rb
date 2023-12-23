class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
  
    
    validates :email, uniqueness: { message: "this email has already been registered, please use a different email or login." }
  end