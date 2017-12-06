require('pry-byebug')
require_relative('./models/artists.rb')
require_relative('./models/albums.rb')

artist1 = Artist.new({
  'name' => 'Biffy Clyro'
  })

artist1.save()

binding.pry
nil
