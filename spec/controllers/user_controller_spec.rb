# frozen_string_literal: true

require 'rails_helper'
RSpec.describe BlogsController, type: :controller do
  describe 'blogs create' do
    it 'blog create' do
      post :create,
           params: { user: { username: 'sakshi jain', password: '12345678', role_id: 1 } }
      # expect(response).to redirect_to('/users/1')
    end

    it 'edit' do
    end

    it 'update' do
    end
    it 'show' do
    end
    it 'new' do
    end
  end
end
