# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memos/edit' do
  let(:memo) do
    Memo.create!(
      user: nil,
      memo_category: nil,
      status: 1,
      description: 'MyText'
    )
  end

  before do
    assign(:memo, memo)
  end

  it 'renders the edit memo form' do
    render

    assert_select 'form[action=?][method=?]', memo_path(memo), 'post' do
      assert_select 'input[name=?]', 'memo[user_id]'

      assert_select 'input[name=?]', 'memo[memo_category_id]'

      assert_select 'input[name=?]', 'memo[status]'

      assert_select 'textarea[name=?]', 'memo[description]'
    end
  end
end
