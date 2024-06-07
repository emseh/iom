# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MemoCategoriesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/memo_categories').to route_to('memo_categories#index')
    end

    it 'routes to #new' do
      expect(get: '/memo_categories/new').to route_to('memo_categories#new')
    end

    it 'routes to #show' do
      expect(get: '/memo_categories/1').to route_to('memo_categories#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/memo_categories/1/edit').to route_to('memo_categories#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/memo_categories').to route_to('memo_categories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/memo_categories/1').to route_to('memo_categories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/memo_categories/1').to route_to('memo_categories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/memo_categories/1').to route_to('memo_categories#destroy', id: '1')
    end
  end
end
