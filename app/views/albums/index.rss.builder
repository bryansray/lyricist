xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.link formatted_albums_url(:rss)
    xml.title "LyricistApp - Albums"
    xml.updated @albums.first.created_at unless @albums.empty?

    @albums.each do |album|
      xml.item do
        xml.id album.id
        xml.published album.created_at
        xml.updated album.updated_at
        xml.link album_url(album)
        xml.title "#{album.name} by #{album.artist.name}"
      end
    end
  end
end
