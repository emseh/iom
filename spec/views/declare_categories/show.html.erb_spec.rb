# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declare_categories/show' do
  before do
    assign(:declare_category, DeclareCategory.create!(
                                name: 'Name'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
