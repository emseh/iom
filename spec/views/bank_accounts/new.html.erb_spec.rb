# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bank_accounts/new' do
  before do
    assign(:bank_account, BankAccount.new(
                            user: nil,
                            payout_channel: nil,
                            name: 'MyString',
                            number: 'MyString',
                            active: false
                          ))
  end

  it 'renders new bank_account form' do
    render

    assert_select 'form[action=?][method=?]', bank_accounts_path, 'post' do
      assert_select 'input[name=?]', 'bank_account[user_id]'

      assert_select 'input[name=?]', 'bank_account[payout_channel_id]'

      assert_select 'input[name=?]', 'bank_account[name]'

      assert_select 'input[name=?]', 'bank_account[number]'

      assert_select 'input[name=?]', 'bank_account[active]'
    end
  end
end
