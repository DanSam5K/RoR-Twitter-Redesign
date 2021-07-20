require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'has many likes' do
      user = User.reflect_on_association(:likes)
      expect(user.macro).to eq(:has_many)
    end
  end
end
