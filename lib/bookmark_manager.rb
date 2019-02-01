require 'pg'
require '/Users/jakeatkin/projects/databases/bookmark/app.rb'

class BookmarkManager
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'bookmark_manager_test')
    else
     connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'bookmark_manager_test')
    else
     connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE url = '#{url}';")
  end
end
