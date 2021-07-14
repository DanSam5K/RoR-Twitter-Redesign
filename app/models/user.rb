class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :fullname, presence: true, length: { maximum: 60 }
  before_save { username.downcase! }
end
