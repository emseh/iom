# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admins/new' do
  before do
    assign(:admin, Admin.new)
  end

  it 'renders new admin form' do
    render

    assert_select 'form[action=?][method=?]', admins_path, 'post' do
    end
  end
end
