require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'has many likes' do
      user = User.reflect_on_association(:likes)
      expect(user.macro).to eq(:has_many)
    end

    it 'belongs to a user' do
      likes = Like.reflect_on_association(:user)
      expect(likes.macro).to eq(:belongs_to)
    end

    it 'belongs to a user' do
      likes = Like.reflect_on_association(:opinion)
      expect(likes.macro).to eq(:belongs_to)
    end

    it 'belongs to a opinion -ve' do
      likes = Like.reflect_on_association(:opinion)
      expect(likes.macro).not_to eq(:has_many)
    end

    it 'belongs to a user -ve ' do
      likes = Like.reflect_on_association(:user)
      expect(likes.macro).not_to eq(:has_many)
    end
  end
end
