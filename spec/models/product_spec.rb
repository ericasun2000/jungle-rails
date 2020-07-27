require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @category = Category.create(name: "Office")
      expect(@category).to be_present
      expect(@category.name).to eq("Office")
    end

    it 'should save' do
      @product = Product.create(name: "Desk", price: 20000, quantity: 40, category_id: 20)
      expect(@product).to be_present
    end

    it 'should have a name' do
      @product = Product.create(name: nil, price: 10000, quantity: 35, category_id: 20)
      expect(@product.name).to be_present
    end

    it 'should have a price' do
      @product = Product.create(name: "Shelf", price: nil, quantity: 35, category_id: 20)
      expect(@product.price).to be_present
    end

    it 'should have a quantity' do
      @product = Product.create(name: "Shelf", price: 10000, quantity: nil, category_id: 20)
      expect(@product.quantity).to be_present
    end

    it 'should have a category' do
      @product = Product.create(name: "Shelf", price: 10000, quantity: 35, category_id: nil)
      expect(@product.category_id).to be_present
    end


  end
end
