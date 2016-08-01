require 'rails_helper'

RSpec.describe Product, type: :model do
  # # describe '#id' do
  # #   # validation tests/examples here
  # #   it 'should not exist for new records' do
  # #     @product = Product.new
  # #     expect(@product.id).to be_nil
  # #   end
  # #   it 'should be auto-assigned by AR for saved records' do
  # #     @product = Product.new
  # #     expect(@product.id).to be_present
  # #   end
  # end

  describe 'Validations' do
    before :each do
      @category = Category.new(name: "Furniture")
    end
    it 'creates a product' do
      product = Product.new(name: "Desk Lamp", price: 25, quantity: 5, category: @category)
      expect(product.valid?).to eql true
    end
    it 'fails when product has no name' do
      product = Product.new(name: nil, price: 25, quantity: 5, category: @category)
      expect(product.valid?).to eql false
      expect(product.errors.size).to eql 1
      expect(product.errors[:name]).to eql ["can't be blank"]
    end
    it 'fails when product has no price' do
      product = Product.new(name: "Chair", price: nil, quantity: 5, category: @category)
      expect(product.valid?).to eql false
      expect(product.errors.size).to eql 3
      expect(product.errors[:price]).to eql ["is not a number", "can't be blank"]
    end
    it 'fails when product has no quantity' do
      product = Product.new(name: "Rug", price: 25, quantity: nil, category: @category)
      expect(product.valid?).to eql false
      expect(product.errors.size).to eql 1
      expect(product.errors[:quantity]).to eql ["can't be blank"]
    end
    it 'fails when product has no category' do
      product = Product.new(name: "Sofa", price: 25, quantity: 5, category: nil)
      expect(product.valid?).to eql false
      expect(product.errors.size).to eql 1
      expect(product.errors[:category]).to eql ["can't be blank"]
    end
  end

end
