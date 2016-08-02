require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do
  before :each do
    @user = User.create!({
      name: "Esther",
      email: "esther@gmail.com",
      password: "esther"
    })
  end

  scenario "They fil in login form" do
    # ACT
    visit login_path
    fill_in 'email', with: 'esther@gmail.com'
    fill_in 'password', with: 'esther'
    submit = page.find_button('Submit')
    submit.click

    # DEBUG / VERIFY

    expect(page).to have_text('My Cart (0)')
    save_screenshot
  end
end
