# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memos/new' do
  before do
    assign(:memo, Memo.new(
                    user: nil,
                    memo_category: nil,
                    status: 1,
                    description: 'MyText'
                  ))
  end

  it 'renders new memo form' do
    render

    assert_select 'form[action=?][method=?]', memos_path, 'post' do
      assert_select 'input[name=?]', 'memo[user_id]'

      assert_select 'input[name=?]', 'memo[memo_category_id]'

      assert_select 'input[name=?]', 'memo[status]'

      assert_select 'textarea[name=?]', 'memo[description]'
    end
  end
end
