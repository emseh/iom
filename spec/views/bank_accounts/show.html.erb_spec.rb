# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bank_accounts/show' do
  before do
    assign(:bank_account, BankAccount.create!(
                            user: nil,
                            payout_channel: nil,
                            name: 'Name',
                            number: 'Number',
                            active: false
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/false/)
  end
end
