require_relative '/Users/jakeatkin/projects/databases/bookmark/app.rb'
require 'pg'
require '/Users/jakeatkin/projects/databases/bookmark/lib/bookmark_manager.rb'

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
