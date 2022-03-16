require 'pg'
class Bookmarks
  class << self
    def all
      connect
      request
      process
    end

    private

    def connect
      @connection = PG.connect(dbname: 'bookmark_manager')
    end

    def request
      @request = @connection.exec( 'SELECT * FROM bookmarks' )
    end

    def process
      @request.map { |bookmark| bookmark['url']}
    end
  end
end