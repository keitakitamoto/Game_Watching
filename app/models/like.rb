class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game, optional: true
  belongs_to :review, optional: true
  #1対他のアソシエーションが複数ある場合
end
