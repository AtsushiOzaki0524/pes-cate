module TopicsHelper
  
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
    else
        # Regex from # https://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
    end
    iframe = content_tag(
      :iframe,
      '', # empty body
      width: 600,
      height: 400,
      src: "https://www.youtube.com/embed/#{youtube_id}",
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  
  end
  
  def youtube_vi(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
    else
        # Regex from # https://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
    end
    iframe = content_tag(
      :iframe,
      '', # empty body
      width: 320,
      height: 180,
      src: "https://i.ytimg.com/vi/#{youtube_id}/mqdefault.jpg",
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  
  end
  
end
