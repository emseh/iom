# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payout_channels/new' do
  before do
    assign(:payout_channel, PayoutChannel.new(
                              name: 'MyString',
                              code: 'MyString',
                              payout_type: 'MyString',
                              active: false
                            ))
  end

  it 'renders new payout_channel form' do
    render

    assert_select 'form[action=?][method=?]', payout_channels_path, 'post' do
      assert_select 'input[name=?]', 'payout_channel[name]'

      assert_select 'input[name=?]', 'payout_channel[code]'

      assert_select 'input[name=?]', 'payout_channel[payout_type]'

      assert_select 'input[name=?]', 'payout_channel[active]'
    end
  end
end
