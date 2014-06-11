class User < ActiveRecord::Base
  #has_many :microposts
  has_many :microposts, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  # set per_page globally
  #WillPaginate.per_page = 11
  self.per_page = 10
  
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
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # Это предварительное решение. См. полную реализацию в "Following users".
    #Micropost.where("user_id = ?", id)
    #Micropost.where("user_id = ?", self.id)
    microposts
  end
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end