class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_save { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil:true
  has_many :netas, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_netas, through: :favorites, source: :neta
  mount_uploader :image, ImageUploader
end
