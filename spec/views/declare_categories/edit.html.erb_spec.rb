# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declare_categories/edit' do
  let(:declare_category) do
    DeclareCategory.create!(
      name: 'MyString'
    )
  end

  before do
    assign(:declare_category, declare_category)
  end

  it 'renders the edit declare_category form' do
    render

    assert_select 'form[action=?][method=?]', declare_category_path(declare_category), 'post' do
      assert_select 'input[name=?]', 'declare_category[name]'
    end
  end
end
