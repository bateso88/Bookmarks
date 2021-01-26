feature 'Adding bookmarks' do
  scenario 'the user can add new bookmark' do
    visit('/')
    click_button 'Add bookmark'
    expect(page).to have_content('Enter URL:')
  end

  scenario 'the user adds a bookmark via a form' do
    visit('/add_bookmark')
    fill_in('url' , with: 'http://www.twitter.com')
    expect(page).to have_content('http://www.twitter.com')
  end
end
