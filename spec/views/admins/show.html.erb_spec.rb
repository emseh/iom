# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admins/show' do
  before do
    assign(:admin, Admin.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
