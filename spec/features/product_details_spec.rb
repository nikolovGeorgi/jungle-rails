require 'rails_helper'

RSpec.feature "Product Details", type: :feature, js: true do

  # SETUP
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

  scenario "They see all products" do
    # ACT
    visit root_path
    product = page.all('article.product a').first.text
    click_link(product)

    # VERIFY
    expect(page).to have_css 'article.product-detail', count: 1

    # DEBUG
    # puts page.html
    save_screenshot
  end
end
