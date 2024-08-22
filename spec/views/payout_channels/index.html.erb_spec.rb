# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payout_channels/index' do
  before do
    assign(:payout_channels, [
             PayoutChannel.create!(
               name: 'Name',
               code: 'Code',
               payout_type: 'Payout Type',
               active: false
             ),
             PayoutChannel.create!(
               name: 'Name',
               code: 'Code',
               payout_type: 'Payout Type',
               active: false
             )
           ])
  end

  it 'renders a list of payout_channels' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Payout Type'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
