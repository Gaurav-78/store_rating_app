class Store < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :ratings

  validates :name, presence: true
  validates :address, length: { maximum: 400 }
  
 def overall_rating
    ratings.any? ? ratings.average(:score).to_f : 0.0
  end
end
