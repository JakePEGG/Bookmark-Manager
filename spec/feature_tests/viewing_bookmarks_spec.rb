require_relative '/Users/jakeatkin/projects/databases/bookmark/app.rb'

require 'pg'


feature 'Viewing bookmarks' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'

      expect(page).to have_content 'Bookmark Manager'
    end
  end

  feature 'viewing bookmarks' do
    scenario 'bookmarks are visible' do
      BookmarkManager.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      BookmarkManager.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      BookmarkManager.create(url: "http://www.google.com", title: "Google")

      visit '/bookmarks'

      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end
end
