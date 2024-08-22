# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payout_channels/show' do
  before do
    assign(:payout_channel, PayoutChannel.create!(
                              name: 'Name',
                              code: 'Code',
                              payout_type: 'Payout Type',
                              active: false
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Payout Type/)
    expect(rendered).to match(/false/)
  end
end
