# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bank_accounts/index' do
  before do
    assign(:bank_accounts, [
             BankAccount.create!(
               user: nil,
               payout_channel: nil,
               name: 'Name',
               number: 'Number',
               active: false
             ),
             BankAccount.create!(
               user: nil,
               payout_channel: nil,
               name: 'Name',
               number: 'Number',
               active: false
             )
           ])
  end

  it 'renders a list of bank_accounts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
