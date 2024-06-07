# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memo_categories/show' do
  before do
    assign(:memo_category, MemoCategory.create!(
                             name: 'Name'
                           ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
