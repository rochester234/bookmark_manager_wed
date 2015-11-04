feature 'Filter links' do
  scenario 'filter links by tags' do
    visit '/links/new'
    fill_in 'title', with: 'I love bubbles'
    fill_in 'url', with: 'www.bubblesrus.com'
    fill_in 'name', with: 'bubbles'
    click_button 'Submit'
    visit '/tags/bubbles'
  end
end
