xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.link formatted_lyrics_url(:rss)
    xml.title "LyricistApp - Lyrics"
    xml.updated @lyrics.first.created_at unless @lyrics.empty?

    @lyrics.each do |lyric|
      xml.item do
        xml.id lyric.id
        xml.published lyric.created_at
        xml.updated lyric.updated_at
        xml.link lyric_url(lyric)
        xml.title "#{lyric.name} by #{lyric.artist.name}"
      end
    end
  end
end
