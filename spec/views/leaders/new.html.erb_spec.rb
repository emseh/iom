# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'leaders/new' do
  before do
    assign(:leader, Leader.new)
  end

  it 'renders new leader form' do
    render

    assert_select 'form[action=?][method=?]', leaders_path, 'post' do
    end
  end
end
