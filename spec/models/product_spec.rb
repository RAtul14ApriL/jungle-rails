require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it "Valid when no attribute is missing" do
      category = Category.new(name: 'ABCD')
      product = Product.new(name: "Laptop", price: 1500, category: category, quantity: 12)
      expect(product).to be_valid
      expect(product.errors.full_messages).to be_empty
    end

    it "invalid when name is missing" do
      category = Category.new(name: 'ABCD')
      product = Product.new(name: nil, price: 1500, category: category, quantity: 15)
      expect(product).to be_invalid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "invalid when price is missing" do
      category = Category.new(name: 'ABCD')
      product = Product.new(name: "Laptop", price: nil, category: category, quantity: 15)
      expect(product).to be_invalid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "invalid when category is missing" do
      product = Product.new(name: "Laptop", price: 1500, category: nil, quantity: 15)
      expect(product).to be_invalid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

    it "invalid when quantity is missing" do
      category = Category.new(name: 'ABCD')
      product = Product.new(name: "Laptop", price: 1500, category: category, quantity: nil)
      expect(product).to be_invalid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
  end 
end
