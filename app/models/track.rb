class Track < ActiveRecord::Base
  belongs_to :song

  validates :instrument,
    presence: true

  validates :soundcloud,
    numericality: { only_integer: true }

  def soundcloud_url
    SoundCloud.new(
    client_id: ENV.fetch("SC_CLIENT_ID"),
    client_secret: ENV.fetch("SC_CLIENT_SECRET")
    )
  end
end
