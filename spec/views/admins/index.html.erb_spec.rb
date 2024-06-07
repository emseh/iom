# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admins/index' do
  before do
    assign(:admins, [
             Admin.create!,
             Admin.create!
           ])
  end

  it 'renders a list of admins' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
