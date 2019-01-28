require_relative '/Users/jakeatkin/projects/databases/bookmark/app.rb'

  feature 'bookmarks' do
    scenario 'expect there to be a bookmark list'do
    visit ('bookmarks')
    expect(page).to have_content('Bookmarks')
  end
end

  feature 'viewing a list of bookmarks' do
    scenario 'expect a list of websites' do
      visit ('/bookmarks')

      expect(page).to have_content "www.github.com"
      expect(page).to have_content "www.codewars.com"
      expect(page).to have_content "www.codeacademy.com"
    end
  end
