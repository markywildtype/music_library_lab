require('pry-byebug')
require_relative('./models/artists.rb')
require_relative('./models/albums.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Biffy Clyro'
})

artist2 = Artist.new({
  'name' => 'Arcane Roots'
})

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'The Vertigo of Bliss',
  'genre' => 'Alternative Rock',
  'artist_id' => artist1.id
  })

  album2 = Album.new({
    'title' => 'Opposites',
    'genre' => 'Alternative Rock',
    'artist_id' => artist1.id
    })

  album3 = Album.new({
    'title' => 'Melancholia Hymns',
    'genre' => 'Progressive Post-Hardcore',
    'artist_id' => artist2.id
    })

album1.save()
album2.save()
album3.save()

artists = Artist.all
albums = Album.all

# artist1.name = 'Mon the Biff'
# artist1.update()
# album2.genre = 'Slightly Lame Rock'
# album2.update_genre()
# album2.title = 'Pooposites'
# album2.update_title()

artists = Artist.all
albums = Album.all

# Album.delete('Pooposites')

# Artist.delete('Biffy Clyro', artist1.id)

artist_albums = artist1.albums()
artist_albums2 = artist2.albums()

album_artist = album1.artist()

find_artist = Artist.find_by_id(artist1.id)
find_album = Album.find_by_id(album2.id)

binding.pry
nil
