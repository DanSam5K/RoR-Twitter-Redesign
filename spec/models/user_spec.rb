require 'rails_helper'

RSpec.describe User, type: :model do
  # include Warden::Test::Helpers
  # Warden.test_mode!
  let(:current_user) { User.create!(name: 'Tester', email: 'test@example.com', password: 'f4k3p455w0rd') }
  let(:user) { User.create(name: 'JohnDoe', email: 'johndoe@example.com', password: '123456') }
  let(:user2) { User.create(name: 'Ying Yang', email: 'yingyang@example.com', password: '123456')}
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
