# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'memo_categories/index' do
  before do
    assign(:memo_categories, [
             MemoCategory.create!(
               name: 'Name'
             ),
             MemoCategory.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of memo_categories' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
