# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/leaders' do
  # This should return the minimal set of attributes required to create a valid
  # Leader. As you add validations to Leader, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Leader.create! valid_attributes
      get leaders_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      leader = Leader.create! valid_attributes
      get leader_url(leader)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_leader_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      leader = Leader.create! valid_attributes
      get edit_leader_url(leader)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Leader' do
        expect do
          post leaders_url, params: { leader: valid_attributes }
        end.to change(Leader, :count).by(1)
      end

      it 'redirects to the created leader' do
        post leaders_url, params: { leader: valid_attributes }
        expect(response).to redirect_to(leader_url(Leader.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Leader' do
        expect do
          post leaders_url, params: { leader: invalid_attributes }
        end.not_to change(Leader, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post leaders_url, params: { leader: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested leader' do
        leader = Leader.create! valid_attributes
        patch leader_url(leader), params: { leader: new_attributes }
        leader.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the leader' do
        leader = Leader.create! valid_attributes
        patch leader_url(leader), params: { leader: new_attributes }
        leader.reload
        expect(response).to redirect_to(leader_url(leader))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        leader = Leader.create! valid_attributes
        patch leader_url(leader), params: { leader: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested leader' do
      leader = Leader.create! valid_attributes
      expect do
        delete leader_url(leader)
      end.to change(Leader, :count).by(-1)
    end

    it 'redirects to the leaders list' do
      leader = Leader.create! valid_attributes
      delete leader_url(leader)
      expect(response).to redirect_to(leaders_url)
    end
  end
end