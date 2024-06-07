# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeclaresController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/declares').to route_to('declares#index')
    end

    it 'routes to #new' do
      expect(get: '/declares/new').to route_to('declares#new')
    end

    it 'routes to #show' do
      expect(get: '/declares/1').to route_to('declares#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/declares/1/edit').to route_to('declares#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/declares').to route_to('declares#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/declares/1').to route_to('declares#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/declares/1').to route_to('declares#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/declares/1').to route_to('declares#destroy', id: '1')
    end
  end
end
