# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admins/edit' do
  let(:admin) do
    Admin.create!
  end

  before do
    assign(:admin, admin)
  end

  it 'renders the edit admin form' do
    render

    assert_select 'form[action=?][method=?]', admin_path(admin), 'post' do
    end
  end
end
