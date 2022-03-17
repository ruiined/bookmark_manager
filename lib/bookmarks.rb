# frozen_string_literal: true

require_relative 'bookmark'

require 'pg'
class Bookmarks
  class << self
    def all(bookmark_class = Bookmark)
      connect
      request('SELECT * FROM bookmarks')
      process(bookmark_class)
    end

    def add_bookmark(bookmark)
      connect
      request("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark.url}', '#{bookmark.title}')")
    end

    private

    def connect
      @connection = PG.connect(dbname: database_name)
    end

    def request(command)
      @request = @connection.exec(command)
    end

    def process(bookmark_class)
      @request.map do |bookmark|
        bookmark_class.new(bookmark['url'], bookmark['title'])
      end
    end

    def database_name
      ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    end
  end
end
