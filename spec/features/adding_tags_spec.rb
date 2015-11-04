
feature "adding links" do
  scenario "with tags" do
    visit('/')
    click_button('add links')
    fill_in('add_title', with: 'Google')
    fill_in('add_url', with: 'http://www.google.co.uk')
    fill_in('add_tag', with: 'search')
    click_button('add link')
    expect(page).to have_content('search')
  end
end