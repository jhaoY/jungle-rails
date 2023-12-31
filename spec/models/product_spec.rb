require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.create(name: "Test Category")
    end
    it "validates with all fields" do
      @product = Product.new(name: 'Test Name', price_cents: 99.99, quantity: 5, category_id: @category.id )

      expect(@product).to be_valid
    end

    it "name cannot be nil" do  
      @product = Product.new(name: nil, price_cents: 99.99, quantity: 5, category_id: @category.id )

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "price cannot be nil" do
      @product = Product.new(name: 'Test Name', price_cents: nil, quantity: 5, category_id: @category.id )

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "quantity cannot be nil" do
      @product = Product.new(name: 'Test Name', price_cents: 99.99, quantity: nil, category_id: @category.id )

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "category cannot be nil" do
      @product = Product.new(name: 'Test Name', price_cents: 99.99, quantity: 5, category_id: nil )

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
