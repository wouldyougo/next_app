class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  # set per_page globally
  #WillPaginate.per_page = 11
  self.per_page = 10

  # будем называть “поток”
  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by_v1(user)
    followed_user_ids = user.followed_user_ids
    # where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
    # Синтаксис со знаком вопроса хорош,
    # но когда мы хотим ту же переменную вставить более чем в одном месте,
    # второй вариант синтаксиса является более удобным:
    where("user_id IN (:followed_user_ids) OR user_id = :user_id",
          followed_user_ids: followed_user_ids, user_id: user)
  end

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end