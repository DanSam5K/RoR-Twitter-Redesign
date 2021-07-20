require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user1) { User.create!(username: 'user1', fullname: 'name1', photo: 'link', coverimage: 'link')}
  let(:opinion1) { Opinion.create(author_id: user1.id, text: 'tweet1') }
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
