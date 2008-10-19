xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.link formatted_songs_url(:rss)
    xml.title "LyricistApp - Songs"
    xml.updated @songs.first.created_at unless @songs.empty?

    @songs.each do |song|
      xml.item do
        xml.id song.id
        xml.published song.created_at
        xml.updated song.updated_at
        xml.link song_url(song)
        xml.title "#{song.title} by #{song.artist.name}"
      end
    end
  end
end
