class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followings, through: :follower, source: :followed
  has_many :followers, through: :followed, source: :follower

  attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  
  # ユーザーをフォローする
  def follow(other_user)
    unless self == other_user
    follower.create(followed_id: other_user.id)
    end
  end
  # ユーザーのフォローを外す
  def unfollow(other_user)
    follower.find_by(followed_id: other_user.id).destroy
  end
  # フォロー確認をおこなう
  def following?(other_user)
    followings.include?(other_user)
  end
end
