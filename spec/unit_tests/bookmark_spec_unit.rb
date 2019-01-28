require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("www.github.com")
      expect(bookmarks).to include("www.codewars.com")
      expect(bookmarks).to include("www.codeacademy.com")
    end
  end
end
