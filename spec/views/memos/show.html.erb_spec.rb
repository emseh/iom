# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memos/show' do
  before do
    assign(:memo, Memo.create!(
                    user: nil,
                    memo_category: nil,
                    status: 2,
                    description: 'MyText'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
