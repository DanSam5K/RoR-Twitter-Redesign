class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :fullname, presence: true, length: { maximum: 60 }

  has_many :created_opinions, foreign_key: :author_id, class_name: 'Opinion'

  has_many :followers, foreign_key: :follower_id, class_name: 'Following'
  has_many :user_followers, through: :followers, source: :follower

  has_many :followed, foreign_key: :followed_id, class_name: 'Following'
  has_many :user_followed, through: :followed, source: :followed

  has_many :likes, dependent: :destroy

  has_one_attached :photo
  has_one_attached :cover_image


  def not_following
    User.all.where.not(id: user_followers.select(:id)).where.not(id: id).order(created_at: :desc)
  end

  def follow_user(user_id)
    @follow = Following.create(follower_id: id, followed_id: user_id)
    @user = User.find(user_id)
    @user.count_following += 1
    self.count_followers += 1
    @user.save
    save
  end

  def already_follow?(user_id)
    true if Following.find_by(follower_id: id, followed_id: user_id)
  end
end
