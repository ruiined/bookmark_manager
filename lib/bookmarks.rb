# frozen_string_literal: true

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
      @connection = PG.connect(dbname: database_name)
    end

    def request
      @request = @connection.exec('SELECT * FROM bookmarks')
    end

    def process
      @request.map { |bookmark| bookmark['url'] }
    end

    def database_name
      ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    end
  end
end
