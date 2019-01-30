require_relative '/Users/jakeatkin/projects/databases/bookmark/app.rb'

feature "Index" do
  scenario "Expect page to contain Hello world!" do
  visit ('/')
  expect(page).to have_content("Bookmark Manager")
end
end
