class Track < ActiveRecord::Base
  belongs_to :song


  def iframe_remover(iframe)
  html = iframe.gsub!(/"/, '').gsub!(/\s+/, "").gsub!('<iframewidth=70%height=100scrolling=noframeborder=nosrc=', '').gsub!('></iframe>', '')
  sa = "&single_active=false"
  final = html + sa
  final
  end
end
