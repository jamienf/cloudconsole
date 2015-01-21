class Band < ActiveRecord::Base
  has_many :band_members, dependent: :destroy
  has_many :users, through: :band_members
  has_many :songs, dependent: :destroy

  mount_uploader :band_photo, BandPhotoUploader

  validates :name,
    presence: true

  validates :bio,
    presence: true,
    length: { minimum: 1, maximum: 300 }

  validates :genre,
    presence: true

    def self.search(query)
      where("name like ? OR bio ILIKE ? OR genre ILIKE ?", "%" + query + "%", "%" + query + "%", "%" + query + "%")
    end
end
