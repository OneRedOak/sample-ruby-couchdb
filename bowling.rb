require 'couchrest'

class Bowling
  @var = 0
  @db = CouchRest.database!("http://127.0.0.1:5984/test")

  def hit()
    response = @db.save_doc({
        :key => 1234,
        :title => "Bowling Score",
        :content => "Strike"
    })

    @var = @db.get(response['id'])['key']
  end

  def score
  	return @var
  end
end

