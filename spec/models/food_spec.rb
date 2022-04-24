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
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 20000.0
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end
end