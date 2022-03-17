# frozen_string_literal: true

feature 'add bookmark' do
  scenario 'the button directs you to the add page' do
    visit('/bookmarks')
    click_button('Add bookmark')
    expect(page).to have_field
  end

  scenario 'saves the bookmark' do
    visit('/bookmarks')
    click_button('Add bookmark')
    fill_in(name: 'url', with: 'https://devhints.io/capybara')
    fill_in(name: 'title', with: 'Capybara Cheatsheet')
    click_button('Submit')
    expect(page).to have_link('Capybara Cheatsheet', href: 'https://devhints.io/capybara')
  end
end
