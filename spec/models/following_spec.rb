require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'associations' do
    it 'has many followers' do
      user = User.reflect_on_association(:followers)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many followed' do
      user = User.reflect_on_association(:followed)
      expect(user.macro).to eq(:has_many)
    end
  end
end