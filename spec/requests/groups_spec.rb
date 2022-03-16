require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'User1', email: 'Test@mail.com', password: '123456') }
  let(:group) { user.groups.create!(name: 'shopping', icon: 'img1.png') }

  describe 'GET /index' do
    before do
      sign_in user
      get groups_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /show' do
    before do
      sign_in user
      get group_path(1)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct name of group' do
      expect(response.body).to include('shopping')
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_group_path
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Name')
    end
  end
end
