# frozen_string_literal: true

feature 'Deleting bookmarks' do
  scenario 'the user adds a bookmark and deletes it' do
    visit('/add_bookmark')
    fill_in('title', with: 'Twitter')
    fill_in('url', with: 'http://www.twitter.com')
    click_button('Submit')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
