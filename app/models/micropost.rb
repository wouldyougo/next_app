class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  # set per_page globally
  #WillPaginate.per_page = 11
  self.per_page = 10  
end