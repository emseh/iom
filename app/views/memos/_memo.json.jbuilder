# frozen_string_literal: true

json.extract! memo, :id, :user_id, :memo_category_id, :status, :description, :created_at, :updated_at
json.url memo_url(memo, format: :json)
