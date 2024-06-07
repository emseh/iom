# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memo_categories/edit' do
  let(:memo_category) do
    MemoCategory.create!(
      name: 'MyString'
    )
  end

  before do
    assign(:memo_category, memo_category)
  end

  it 'renders the edit memo_category form' do
    render

    assert_select 'form[action=?][method=?]', memo_category_path(memo_category), 'post' do
      assert_select 'input[name=?]', 'memo_category[name]'
    end
  end
end
