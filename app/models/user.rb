class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 3, maximum: 50 } 
    
  #validates(:name, presence: true)
  #validates :name,  presence: true, length: { maximum: 50 }
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  
  #validates :email, presence: true  
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  before_save { self.email = email.downcase }                                       
end
