require_relative('../db/sql_runner.rb')
require_relative('./albums.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ($1)
    RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def Artist.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    albums_by_artist = SqlRunner.run(sql, values)
    return albums_by_artist.map {|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def Artist.delete(artist, artist_id)
    sql = "DELETE FROM artists
    WHERE name = $1;"
    values = [artist]
    SqlRunner.run(sql, values)
  end

  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    found_artist = SqlRunner.run(sql, values)
    return found_artist[0]
  end

end
