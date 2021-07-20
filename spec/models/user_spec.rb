require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'JohnDoe', fullname: 'John Doe') }
  describe 'validations' do
    describe 'username' do
      it 'must be present' do
        user = described_class.new(username: 'John', fullname: 'John Emma')
        expect(user).to be_valid
        user.username = nil
        expect(user).to_not be_valid
      end
    end
    describe 'fullname' do
      it 'must be present' do
        user = described_class.new(username: 'John', fullname: 'John Son')
        expect(user).to be_valid
        user.fullname = nil
        expect(user).to_not be_valid
      end
    end

    describe 'username' do
      it 'must be present' do
        user = described_class.new(username: 'John', fullname: 'John Emma')
        expect(user).to be_valid
        user.username = 'John'
        expect(user).to be_valid
      end
    end
    describe 'fullname' do
      it 'must be present' do
        user = described_class.new(username: 'John', fullname: 'John Son')
        expect(user).to be_valid
        user.fullname = 'John Son'
        expect(user).to be_valid
      end
    end

    describe 'associations' do
      it 'has many opinions' do
        user = User.reflect_on_association(:created_opinions)
        expect(user.macro).to eq(:has_many)
      end
  
      it 'has many likes' do
        user = User.reflect_on_association(:likes)
        expect(user.macro).to eq(:has_many)
      end

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
end
