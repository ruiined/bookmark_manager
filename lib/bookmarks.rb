# frozen_string_literal: true

require_relative 'bookmark'

require 'pg'
class Bookmarks
  class << self
    def all(bookmark_class = Bookmark)
      @bookmark_class = bookmark_class
      connect
      request('SELECT * FROM bookmarks')
      process
    end

    def create(url, title)
      connect
      result = safe_request('INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;',
                            [url, title])
      # testing? ? @bookmark_class.new(13, url, title) : process_created(result)
      process_created(result)
    end

    def delete(id)
      connect
      safe_request('DELETE FROM bookmarks WHERE id = $1', [id])
    end

    private

    def process_created(result)
      @bookmark_class.new(result[0]['id'], result[0]['title'], result[0]['url'])
    end

    def connect
      @connection = PG.connect(dbname: database_name)
    end

    def request(command)
      @request = @connection.exec(command)
    end

    def safe_request(command, params)
      @request = @connection.exec_params(command, params)
    end

    def process
      @request.map do |bookmark|
        @bookmark_class.new(bookmark['id'], bookmark['url'], bookmark['title'])
      end
    end

    def database_name
      testing? ? 'bookmark_manager_test' : 'bookmark_manager'
    end

    def testing?
      ENV['RACK_ENV'] == 'test'
    end
  end
end
