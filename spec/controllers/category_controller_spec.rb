# frozen_string_literal: true

require 'rails_helper'
RSpec.describe CategoriesController, type: :controller do
  describe 'category create and destory category' do
    it 'create the category' do
      post :create,
           params: { category: { name: 'media' } }
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
