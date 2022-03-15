feature "view bookmarks" do
  scenario "displays a list of bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("google.com")
  end
end