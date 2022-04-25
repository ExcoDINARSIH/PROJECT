require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name and a description' do
    food = Food.new(
      name: 'Nasi Kuning',
      description: 'Indonesian rice cooked with coconut milk and turmeric.',
      price: 20000.0
    )

    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = Food.new(
      name: nil,
      description: 'Indonesian rice cooked with coconut milk and turmeric.',
      price: 20000.0
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    food1 = Food.create(
      name: "Nasi Kuning",
      description: "Indonesian rice cooked with coconut milk and turmeric.",
      price: 20000.0
    )
    
    food2 = Food.new(
      name: "Nasi Kuning",
      description: "Just with a different description.",
      price: 20000.0
    )

    food2.valid?
    
    expect(food2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid without a price' do
    food = Food.new(
      name: 'Nasi Kuning',
      description: 'Indonesian rice cooked with coconut milk and turmeric.',
      price: nil
    )

    food.valid?

    expect(food.errors[:price]).to include("can't be blank")
  end
end