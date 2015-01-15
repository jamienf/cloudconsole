class Song < ActiveRecord::Base
  belongs_to :band

  validates :title,
    presence: true

  validates :tempo,
    presence: true,
    numericality: { only_integer: true,
                     less_than: 600 }
end
