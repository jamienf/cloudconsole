class Track < ActiveRecord::Base
  VALID_SOUNDCLOUD

  belongs_to :song

  validates :instrument,
    presence: true

  validates :soundcloud,
    presence: true

  # def iframe_remover(iframe)
  #   html = iframe.gsub!(/"/, '').gsub!(/\s+/, "").gsub!('<iframewidth=70%height=100scrolling=noframeborder=nosrc=', '').gsub!('></iframe>', '')+"&single_active=false"
  #   sa = "&single_active=false"
  #   final = html + sa
  #   final
  # end
end
