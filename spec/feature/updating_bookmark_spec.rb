feature 'Updating bookmarks' do 
  scenario 'Create a new bookmark and then update it' do 
    Bookmark.create(url: 'http://www.twitter.com',title: 'Twitter')
    visit('/bookmarks')
    expect(page).to have_content "Twitter"
    first('.bookmark').click_button "Update"

    fill_in('title', with: "Facebook")  
    fill_in('url', with: "http://www.facebook.com")
    click_button "Update" 
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Twitter'
    expect(page).to have_content 'Facebook'
  end
end

