class User < ApplicationRecord
  has_secure_password

  has_many :ratings
  has_one :store, foreign_key: 'owner_id'

  enum role: { normal: 0, store_owner: 1, admin: 2 }

  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 8..16 }, format: { with: /(?=.*[A-Z])(?=.*\W)/ }, if: -> { password.present? }
end
