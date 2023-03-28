require 'rails_helper'

# Arrange, Act, Assert

RSpec.describe User, type: :model do
  context 'Validate not null fields' do
    it 'should have not null name field' do
      user = build(:user)

      expect(user.valid?).to eq(true)
    end
  end
end
