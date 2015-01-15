class Band < ActiveRecord::Base
  has_many :bandmembers
  has_many :users, through: :bandmembers

  validates :name,
    presence: true

  validates :bio,
    presence: true

  validates :genre,
    presence: true
end
