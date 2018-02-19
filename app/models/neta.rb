class Neta < ApplicationRecord
  validates :neta_name, presence: true
  validates :source, presence: true
  validates :impression, length: { in: 0..256 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
