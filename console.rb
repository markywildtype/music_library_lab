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

album1.save()

artists = Artist.all

binding.pry
nil
