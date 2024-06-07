# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patners/new' do
  before do
    assign(:patner, Patner.new(
                      name: 'MyString'
                    ))
  end

  it 'renders new patner form' do
    render

    assert_select 'form[action=?][method=?]', patners_path, 'post' do
      assert_select 'input[name=?]', 'patner[name]'
    end
  end
end
