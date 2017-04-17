require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should not save without a name' do
      @cat1 = Category.find_or_create_by! name: 'School'
      product = Product.create(
        name: nil,
        price: 0.99,
        quantity: 99,
        category: @cat1
      )
      expect(product).to_not be_persisted
    end

    it 'should not save without a price' do
      @cat1 = Category.find_or_create_by! name: 'School'
      product = Product.create(
        name: 'pen',
        price: nil,
        quantity: 99,
        category: @cat1
      )
      expect(product).to_not be_persisted
    end

    it 'should not save without quantity' do
      @cat1 = Category.find_or_create_by! name: 'School'
      product = Product.create(
        name: 'pen',
        price: 2,
        quantity: nil,
        category: @cat1
      )
      expect(product).to_not be_persisted
    end

    it 'should not save without category' do
      @cat1 = Category.find_or_create_by! name: 'School'
      product = Product.create(
        name: 'pen',
        price: 0.99,
        quantity: 99,
        category: nil
      )
      expect(product).to_not be_persisted
    end

    it 'should be invalid if price is negative or zero' do
      @cat1 = Category.find_or_create_by! name: 'School'
      product = Product.new(
        name: 'pen',
        price: 0.99,
        quantity: 99,
        category: @cat1
      )
      expect(product).to_not be_valid
    end

  end
end
