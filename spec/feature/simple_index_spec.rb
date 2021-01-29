# frozen_string_literal: true

feature 'index page' do
  scenario 'testing index page' do
    visit('/')
    expect(page).to have_content('Welcome to your Bookmark Manager!')
  end
end
