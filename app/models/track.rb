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


# format: { with: VALID_SOUNDCLOUD_URL, message: "Please use the valid Soundcloud URL address."}
# VALID_SOUNDCLOUD_URL = /https:\/\/soundcloud.com\/[A-Z0-9._%+-]+\/[A-Z0-9._%+-]+/i
