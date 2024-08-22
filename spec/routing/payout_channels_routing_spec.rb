# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PayoutChannelsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/payout_channels').to route_to('payout_channels#index')
    end

    it 'routes to #new' do
      expect(get: '/payout_channels/new').to route_to('payout_channels#new')
    end

    it 'routes to #show' do
      expect(get: '/payout_channels/1').to route_to('payout_channels#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/payout_channels/1/edit').to route_to('payout_channels#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/payout_channels').to route_to('payout_channels#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/payout_channels/1').to route_to('payout_channels#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/payout_channels/1').to route_to('payout_channels#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/payout_channels/1').to route_to('payout_channels#destroy', id: '1')
    end
  end
end
