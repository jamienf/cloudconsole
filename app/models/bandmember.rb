class Bandmember < ActiveRecord::Base
  belongs_to :user
  belongs_to :band

  validates :user_id,
  presence: true

  validates :band_id,
  presence: true
end
