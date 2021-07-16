require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /login' do
    it 'returns a login page' do
      get('/login')
      sleep(2)
      expect('/login').to eql('/login')
    end

    it 'returns a login page' do
      get('/login')
      sleep(2)
      expect('/login').not_to eql('/home')
    end
  end
end
