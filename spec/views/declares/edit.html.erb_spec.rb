# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'declares/edit' do
  let(:declare) do
    Declare.create!(
      user: nil,
      declare_category: nil,
      status: 1,
      description: 'MyText'
    )
  end

  before do
    assign(:declare, declare)
  end

  it 'renders the edit declare form' do
    render

    assert_select 'form[action=?][method=?]', declare_path(declare), 'post' do
      assert_select 'input[name=?]', 'declare[user_id]'

      assert_select 'input[name=?]', 'declare[declare_category_id]'

      assert_select 'input[name=?]', 'declare[status]'

      assert_select 'textarea[name=?]', 'declare[description]'
    end
  end
end
