xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.link formatted_artists_url(:rss)
    xml.title "LyricistApp - artists"
    xml.updated @artists.first.created_at unless @artists.empty?

    @artists.each do |artist|
      xml.item do
        xml.id artist.id
        xml.published artist.created_at
        xml.updated artist.updated_at
        xml.link artist_url(artist)
        xml.title "#{artist.name}"
      end
    end
  end
end
