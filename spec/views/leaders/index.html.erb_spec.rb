# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'leaders/index' do
  before do
    assign(:leaders, [
             Leader.create!,
             Leader.create!
           ])
  end

  it 'renders a list of leaders' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
