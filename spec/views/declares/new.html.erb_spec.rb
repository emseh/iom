# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declares/new' do
  before do
    assign(:declare, Declare.new(
                       user: nil,
                       declare_category: nil,
                       status: 1,
                       description: 'MyText'
                     ))
  end

  it 'renders new declare form' do
    render

    assert_select 'form[action=?][method=?]', declares_path, 'post' do
      assert_select 'input[name=?]', 'declare[user_id]'

      assert_select 'input[name=?]', 'declare[declare_category_id]'

      assert_select 'input[name=?]', 'declare[status]'

      assert_select 'textarea[name=?]', 'declare[description]'
    end
  end
end
