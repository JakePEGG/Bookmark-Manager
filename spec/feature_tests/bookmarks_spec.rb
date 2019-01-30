require_relative '/Users/jakeatkin/projects/databases/bookmark/app.rb'
require 'pg'

  feature 'bookmarks' do
    scenario 'expect there to be a bookmark list'do
    visit ('bookmarks')
    expect(page).to have_content('Bookmarks')
  end
end

  feature 'viewing a list of bookmarks' do
    scenario 'expect a list of websites' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.destroyallsoftware.com');")

      visit('/bookmarks')

      expect(page).to have_content "http://www.makersacademy.com"
      expect(page).to have_content "http://www.google.com"
      expect(page).to have_content "http://www.destroyallsoftware.com"
    end
  end

  feature 'adding bookmarks' do
    scenario 'a user press a button and submit string' do
    visit ('/')
    fill_in 'Add', with: 'http://www.bbc.com'
    end
  end
