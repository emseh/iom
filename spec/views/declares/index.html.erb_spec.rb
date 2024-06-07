# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declares/index' do
  before do
    assign(:declares, [
             Declare.create!(
               user: nil,
               declare_category: nil,
               status: 2,
               description: 'MyText'
             ),
             Declare.create!(
               user: nil,
               declare_category: nil,
               status: 2,
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of declares' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
