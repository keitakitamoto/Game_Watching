class Game < ApplicationRecord
  #belongs_to :admin
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  #ログインしているユーザーがこのゲームをいいねしているかどうかをチェックする記述
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:rate).round(1).to_f
    else
      0.0
    end
  end
  
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:rate).round(1).to_f*100/5
    else
      0.0
    end
  end


  attachment :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :body, presence: true

end
