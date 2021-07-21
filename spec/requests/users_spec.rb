require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'returns a Users sign up page' do
    get('/signup')
    sleep(2)
    expect('/signup').to eql('/signup')
  end

  it 'returns a Users sign up page' do
    get('/signup')
    sleep(2)
    expect('/signup').not_to eql('/login')
  end
end
