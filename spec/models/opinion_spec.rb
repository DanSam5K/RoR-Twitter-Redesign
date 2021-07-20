require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'associations' do
    it 'has many likes' do
      users = User.reflect_on_association(:created_opinions)
      expect(users.macro).to eq(:has_many)
    end

    it 'belongs to a author' do
      opinions = Opinion.reflect_on_association(:author)
      expect(opinions.macro).to eq(:belongs_to)
    end

    it 'belongs to a user' do
      opinions = Opinion.reflect_on_association(:likes)
      expect(opinions.macro).to eq(:has_many)
    end

    it 'belongs to a opinion -ve' do
      opinions = Opinion.reflect_on_association(:likes)
      expect(opinions.macro).not_to eq(:belongs_to)
    end

    it 'belongs to a user -ve ' do
      likes = Like.reflect_on_association(:user)
      expect(likes.macro).not_to eq(:has_many)
    end
  end
end
