# frozen_string_literal: true

json.extract! declare_category, :id, :name, :created_at, :updated_at
json.url declare_category_url(declare_category, format: :json)
