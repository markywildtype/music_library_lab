require('pry-byebug')
require_relative('./models/artists.rb')
require_relative('./models/albums.rb')

artist1 = Artist.new({
  'name' => 'Biffy Clyro'
})

artist1.save()

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

album1.save()
album2.save()

artists = Artist.all
albums = Album.all

artist1.name = 'Mon the Biff'
artist1.update()
album2.genre = 'Slightly Lame Rock'
album2.update_genre()

artists = Artist.all
albums = Album.all

artist_albums = artist1.albums()

album_artist = album1.artist()

binding.pry
nil
