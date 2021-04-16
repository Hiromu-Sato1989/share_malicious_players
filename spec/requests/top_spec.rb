# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tops', type: :request do
  describe 'GET /index' do
    xit 'returns http success' do
      get '/top/index'
      expect(response).to have_http_status(:success)
    end
  end
end
