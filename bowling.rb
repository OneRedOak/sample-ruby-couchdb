require 'rethinkdb'
include RethinkDB::Shortcuts

class Bowling
  @var = 0

  def hit()
    connection = r.connect(:host => 'localhost', :port => 28015).repl
    r.db_drop('test').run
    r.db_create('test').run

    r.db('test').table_create('table').run

    r.table("table").insert({
        :id => 1,
        :title => "Lorem ipsum",
        :content => "Dolor sit amet"
    }).run

    puts r.table('table').get(1).keys.run.length
    @var = r.table('table').get(1).keys.run.length
  end

  def score
  	return @var
  end
end

