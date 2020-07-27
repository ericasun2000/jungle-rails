require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @category = Category.create(name: "Office")
    end

    it 'should save' do
      @product = @category.products.new(name: "Desk", price: 20000, quantity: 40)
      expect(@product).to be_valid
      puts @product.errors.full_messages
    end

    it 'should have a name' do
      @product = @category.products.new(name: nil, price: 10000, quantity: 35)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price' do
      @product = @category.products.new(name: "Shelf", price: nil, quantity: 35)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'should have a quantity' do
      @product = @category.products.new(name: "Shelf", price: 10000, quantity: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category' do
      @product = Product.new(name: "Shelf", price: 10000, quantity: 35, category_id: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
      
    end

  end
end
