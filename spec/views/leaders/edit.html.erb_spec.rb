# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'leaders/edit' do
  let(:leader) do
    Leader.create!
  end

  before do
    assign(:leader, leader)
  end

  it 'renders the edit leader form' do
    render

    assert_select 'form[action=?][method=?]', leader_path(leader), 'post' do
    end
  end
end
