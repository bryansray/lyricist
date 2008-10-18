insert into artists (id, name) select id, name from amarok.artist;
insert into albums (id, name) select id, name from amarok.album;
insert into songs (artist_id, album_id, title ) select artist.id, album.id, tags.title from amarok.tags inner join amarok.album on tags.album = album.id inner join amarok.artist on tags.artist = artist.id;