# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'patners/edit' do
  let(:patner) do
    Patner.create!(
      name: 'MyString'
    )
  end

  before do
    assign(:patner, patner)
  end

  it 'renders the edit patner form' do
    render

    assert_select 'form[action=?][method=?]', patner_path(patner), 'post' do
      assert_select 'input[name=?]', 'patner[name]'
    end
  end
end
