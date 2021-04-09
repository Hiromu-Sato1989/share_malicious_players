# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fighters', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/fighters/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/fighters/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/fighters/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/fighters/show'
      expect(response).to have_http_status(:success)
    end
  end
end
