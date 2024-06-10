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

RSpec.describe '/declare_categories' do
  # This should return the minimal set of attributes required to create a valid
  # DeclareCategory. As you add validations to DeclareCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      DeclareCategory.create! valid_attributes
      get declare_categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      declare_category = DeclareCategory.create! valid_attributes
      get declare_category_url(declare_category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_declare_category_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      declare_category = DeclareCategory.create! valid_attributes
      get edit_declare_category_url(declare_category)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new DeclareCategory' do
        expect do
          post declare_categories_url, params: { declare_category: valid_attributes }
        end.to change(DeclareCategory, :count).by(1)
      end

      it 'redirects to the created declare_category' do
        post declare_categories_url, params: { declare_category: valid_attributes }
        expect(response).to redirect_to(declare_category_url(DeclareCategory.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new DeclareCategory' do
        expect do
          post declare_categories_url, params: { declare_category: invalid_attributes }
        end.not_to change(DeclareCategory, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post declare_categories_url, params: { declare_category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested declare_category' do
        declare_category = DeclareCategory.create! valid_attributes
        patch declare_category_url(declare_category), params: { declare_category: new_attributes }
        declare_category.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the declare_category' do
        declare_category = DeclareCategory.create! valid_attributes
        patch declare_category_url(declare_category), params: { declare_category: new_attributes }
        declare_category.reload
        expect(response).to redirect_to(declare_category_url(declare_category))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        declare_category = DeclareCategory.create! valid_attributes
        patch declare_category_url(declare_category), params: { declare_category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested declare_category' do
      declare_category = DeclareCategory.create! valid_attributes
      expect do
        delete declare_category_url(declare_category)
      end.to change(DeclareCategory, :count).by(-1)
    end

    it 'redirects to the declare_categories list' do
      declare_category = DeclareCategory.create! valid_attributes
      delete declare_category_url(declare_category)
      expect(response).to redirect_to(declare_categories_url)
    end
  end
end