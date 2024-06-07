# frozen_string_literal: true

json.extract! declare, :id, :user_id, :declare_category_id, :status, :description, :created_at, :updated_at
json.url declare_url(declare, format: :json)
