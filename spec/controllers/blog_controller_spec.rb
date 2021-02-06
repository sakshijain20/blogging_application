# frozen_string_literal: true

require 'rails_helper'
RSpec.describe BlogsController, type: :controller do
  describe 'blogs create' do
    it 'blog create' do
      post :create,
           params: { blog: { category_id: 1, user_id: 1, title: 'Related to RTU', read_time: '4ms',
                             content: 'Exams are to be held in february' } }
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
