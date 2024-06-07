# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declare_categories/index' do
  before do
    assign(:declare_categories, [
             DeclareCategory.create!(
               name: 'Name'
             ),
             DeclareCategory.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of declare_categories' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
