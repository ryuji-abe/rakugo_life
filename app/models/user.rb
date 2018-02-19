class User < ApplicationRecord
  extend Enumerize
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :year_of_experience, length: { maximum: 2 }, numericality: true, allow_nil: true
  before_save { email.downcase! }
  has_secure_password
  has_many :netas, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_netas, through: :favorites, source: :neta
  mount_uploader :image, ImageUploader
  enumerize :sex, in: { undefined: 0, male: 1, female: 2 }, default: :undefined
  enumerize :age, in: { undefined: 00, teens: 10, twenties: 20, thirties: 30, forties: 40, fifties: 50,
    sixties: 60, seventies: 70, eighties: 80 }, default: :undefined
end
