require 'rails_helper'

RSpec.feature "Visitor Navigates to Product Details", type: :feature, js: true do
>>>>>>> feature/testing-product-page

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see specific product details" do
    # ACT
    visit root_path
    product = page.first(".product")
    product.find("header a").click

    # DEBUG / VERIFY

    expect(page).to have_css('.products-show')
    save_screenshot
  end

end
