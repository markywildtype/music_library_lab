require('pg')

class SqlRunner

  def run(sql, values = [])
    db = PG.connect({dbname: 'music_library', host: 'localhost'})
    db.prepare('query', sql)
    result = db.exec_prepared('query', values)
    db.close()
    return result
  end

end
