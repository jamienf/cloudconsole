class Song < ActiveRecord::Base
  belongs_to :band
  has_many :tracks

  validates :title,
    presence: true

  validates :tempo,
    presence: true,
    numericality: { only_integer: true,
                     less_than: 600 }
end
