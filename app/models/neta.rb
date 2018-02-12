class Neta < ApplicationRecord
  validates :neta_name, presence: true
  validates :source, length: { in: 1..140 }
  validates :impression, length: { in: 1..256 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
