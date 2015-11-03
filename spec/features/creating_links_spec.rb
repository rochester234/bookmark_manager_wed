feature "Adding a new link" do
  scenario "Adding a site's address and title" do
    visit('/')
    click_button('add links')
    fill_in('add_title', with: 'Google')
    fill_in('add_url', with: 'http:www.//google.com')
    Link.create(url: 'http://www.google.com', title: 'google')
    click_button('add link')
    expect(page).to have_content('google')
  end
end
