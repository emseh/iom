# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memo_categories/new' do
  before do
    assign(:memo_category, MemoCategory.new(
                             name: 'MyString'
                           ))
  end

  it 'renders new memo_category form' do
    render

    assert_select 'form[action=?][method=?]', memo_categories_path, 'post' do
      assert_select 'input[name=?]', 'memo_category[name]'
    end
  end
end
