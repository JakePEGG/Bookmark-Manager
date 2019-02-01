require '/Users/jakeatkin/projects/databases/bookmark/lib/bookmark_manager.rb'

describe BookmarkManagers do
  describe '.delete' do
    it 'deletes a bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      BookmarkManagers.create(url: "http://www.twitter.com", title: "Twitter")
      # bookmark = BookmarkManager.all[0]
      # url = bookmark.url
      # title = bookmark.title
      BookmarkManagers.delete(url: "http://www.twitter.com", title: "Twitter")
      expect(BookmarkManagers.all.empty?).to eq true
    end
  end
end
