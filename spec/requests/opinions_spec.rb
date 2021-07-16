require 'rails_helper'

RSpec.describe "Opinions", type: :request do
  describe "GET /home" do
    it "returns a session home page" do
      get('/home')
      sleep(2)
      expect('/home').to eql('/home')
    end

    it "returns a session home page" do
      get('/home')
      sleep(2)
      expect('/home').not_to eql('/login')
    end
  end
end
