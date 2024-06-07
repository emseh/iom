# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatnersController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/patners').to route_to('patners#index')
    end

    it 'routes to #new' do
      expect(get: '/patners/new').to route_to('patners#new')
    end

    it 'routes to #show' do
      expect(get: '/patners/1').to route_to('patners#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/patners/1/edit').to route_to('patners#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/patners').to route_to('patners#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/patners/1').to route_to('patners#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/patners/1').to route_to('patners#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/patners/1').to route_to('patners#destroy', id: '1')
    end
  end
end
