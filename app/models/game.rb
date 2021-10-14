class Game < ApplicationRecord
  #belongs_to :admin
  belongs_to :genre

  attachment :image

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :body, presence: true

end
