# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payout_channels/edit' do
  let(:payout_channel) do
    PayoutChannel.create!(
      name: 'MyString',
      code: 'MyString',
      payout_type: 'MyString',
      active: false
    )
  end

  before do
    assign(:payout_channel, payout_channel)
  end

  it 'renders the edit payout_channel form' do
    render

    assert_select 'form[action=?][method=?]', payout_channel_path(payout_channel), 'post' do
      assert_select 'input[name=?]', 'payout_channel[name]'

      assert_select 'input[name=?]', 'payout_channel[code]'

      assert_select 'input[name=?]', 'payout_channel[payout_type]'

      assert_select 'input[name=?]', 'payout_channel[active]'
    end
  end
end
