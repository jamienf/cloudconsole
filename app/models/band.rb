class Band < ActiveRecord::Base
  has_many :bandmembers
  has_many :users, through: :bandmembers
  has_many :songs

  validates :name,
    presence: true

  validates :bio,
    presence: true,
    length: { minimum: 1, maximum: 300 }

  validates :genre,
    presence: true
end
