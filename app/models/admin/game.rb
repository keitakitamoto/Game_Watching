class Admin::Game < ApplicationRecord
  belongs_to :admin
  has_many :genres, dependent: :destroy
end
