module ApplicationHelper
  include ERB::Util

  def auth_token
    "<input
    type=\"hidden\"
    name=\"authenticity_token\"
    value=\'#{form_authenticity_token}\'/>".html_safe
  end

  def ugly_lyrics(lyrics)
    lyrics_arr = lyrics.split("\n")

    "<pre>#{h("&#9835".html_safe+ lyrics)}
    </pre>".html_safe

  end
end
