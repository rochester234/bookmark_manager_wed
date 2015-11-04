require './app/models/link'
require 'spec_helper'


feature 'View Links' do
  scenario 'it shows stored links on homepage' do
    Link.create(title: 'google', url: 'www.google.com')
    visit '/'
    click_button 'View Bookmarks'
    within 'ul#links' do
      expect(page).to have_content("www.google.com")
    end
  end
end
