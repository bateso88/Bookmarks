feature "bookmarks page" do
  scenario "shows some bookmarks" do
    visit "/bookmarks"
    expect(page).to have_content "makersacademy"
  end

end
