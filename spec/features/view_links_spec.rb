feature "Viewing links" do
  scenario "Visting the links page" do
    visit ('/')
    expect(page.status_code).to eq(200)
    end
  end
