# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeclareCategoriesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/declare_categories').to route_to('declare_categories#index')
    end

    it 'routes to #new' do
      expect(get: '/declare_categories/new').to route_to('declare_categories#new')
    end

    it 'routes to #show' do
      expect(get: '/declare_categories/1').to route_to('declare_categories#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/declare_categories/1/edit').to route_to('declare_categories#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/declare_categories').to route_to('declare_categories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/declare_categories/1').to route_to('declare_categories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/declare_categories/1').to route_to('declare_categories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/declare_categories/1').to route_to('declare_categories#destroy', id: '1')
    end
  end
end
