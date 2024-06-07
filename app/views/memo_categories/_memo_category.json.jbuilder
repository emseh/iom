# frozen_string_literal: true

json.extract! memo_category, :id, :name, :created_at, :updated_at
json.url memo_category_url(memo_category, format: :json)
