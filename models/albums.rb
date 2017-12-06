require_relative("../db/sql_runner.rb")

class Album

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    artist_hash = SqlRunner.run(sql, values)
    artist_object = artist_hash[0]
    return artist_object
  end

  def update_genre()
    sql = "UPDATE albums SET (genre) = ($1) WHERE id = $2;"
    values = [@genre, @id]
    SqlRunner.run(sql, values)
  end

  def update_title()
    sql = "UPDATE albums SET (title) = ($1) WHERE id = $2;"
    values = [@title, @id]
    SqlRunner.run(sql, values)
  end

  def Album.delete(album)
    sql = "DELETE FROM albums WHERE title = $1;"
    values = [album]
    SqlRunner.run(sql, values)
  end

  def Album.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    found_album = SqlRunner.run(sql, values)
    return found_album[0]
  end

end
