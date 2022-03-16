require 'pg'

def truncate_bookmarks
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec('TRUNCATE bookmarks;')
end