require 'rails_helper'

RSpec.feature "Add to Cart", type: :feature, js: true do

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

  scenario "users can click 'Add to Cart' button, and its content increases" do
    # ACT
    visit root_path

    first('footer.actions').click_on 'Add'

    within "#navbar" do
      expect(page).to have_link("My Cart (1)")
    end

    # DEBUG
    # puts page.html
    save_screenshot
  end

end
