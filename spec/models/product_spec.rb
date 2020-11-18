require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'check save successfully' do
      @category = Category.new(:name => 'Apparel')
      @product = Product.new(:name => "test", :price => 100, :quantity => 10, :category => @category)
      expect(@product.save).to be_truthy
    end
    it 'check the name field' do
      @category = Category.new(:name => 'Apparel')
      @product = Product.new(:name => nil, :price => 100, :quantity => 10, :category => @category)
      expect(@product.save).to be_falsey
      expect(@product.name).to be_falsey
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'check the price field' do
      @category = Category.new(:name => 'Apparel')
      @product = Product.new(:name => 'test', :price => nil, :quantity => 10, :category => @category)
      expect(@product.save).to be_falsey
      expect(@product.price).to be_falsey
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'check the quantity field' do
      @category = Category.new(:name => 'Apparel')
      @product = Product.new(:name => 'test', :price => 100, :quantity => nil, :category => @category)
      expect(@product.save).to be_falsey
      expect(@product.quantity).to be_falsey
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'check the category field' do
      @product = Product.new(:name => 'test', :price => 100, :quantity => 10, :category => nil)
      expect(@product.save).to be_falsey
      expect(@product.category).to be_falsey
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
