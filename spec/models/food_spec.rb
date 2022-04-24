require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name and a description' do
    food = Food.new(
      name: 'Nasi Kuning',
      description: 'Indonesian rice cooked with coconut milk and turmeric.',
      price: 15000.0
    )

    expect(food).to be_valid
  end
end