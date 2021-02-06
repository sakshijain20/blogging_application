# frozen_string_literal: true

require 'rails_helper'
RSpec.describe SessionController, type: :controller do
  describe 'logs in and logs out' do
    it 'logs in to app' do
      post :create, params: { session: { user_id: 'sakshi jain', password: '12345678' } }
      # expect(response).to redirect_to('/users/1')
    end
    it 'logs out from app' do
      session[:user_id] = 1
      post :destroy
      # expect(response).to redirect_to('/')
    end
  end
end
