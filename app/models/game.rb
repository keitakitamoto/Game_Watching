class Game < ApplicationRecord
  #belongs_to :admin
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  #ログインしているユーザーがこのゲームをいいねしているかどうかをチェックする記述

  attachment :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :body, presence: true

end
