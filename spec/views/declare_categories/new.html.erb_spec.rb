# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declare_categories/new' do
  before do
    assign(:declare_category, DeclareCategory.new(
                                name: 'MyString'
                              ))
  end

  it 'renders new declare_category form' do
    render

    assert_select 'form[action=?][method=?]', declare_categories_path, 'post' do
      assert_select 'input[name=?]', 'declare_category[name]'
    end
  end
end
