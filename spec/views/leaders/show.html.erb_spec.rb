# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'leaders/show' do
  before do
    assign(:leader, Leader.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
