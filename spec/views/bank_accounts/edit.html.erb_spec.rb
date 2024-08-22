# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bank_accounts/edit' do
  let(:bank_account) do
    BankAccount.create!(
      user: nil,
      payout_channel: nil,
      name: 'MyString',
      number: 'MyString',
      active: false
    )
  end

  before do
    assign(:bank_account, bank_account)
  end

  it 'renders the edit bank_account form' do
    render

    assert_select 'form[action=?][method=?]', bank_account_path(bank_account), 'post' do
      assert_select 'input[name=?]', 'bank_account[user_id]'

      assert_select 'input[name=?]', 'bank_account[payout_channel_id]'

      assert_select 'input[name=?]', 'bank_account[name]'

      assert_select 'input[name=?]', 'bank_account[number]'

      assert_select 'input[name=?]', 'bank_account[active]'
    end
  end
end
