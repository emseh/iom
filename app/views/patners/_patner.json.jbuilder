# frozen_string_literal: true

json.extract! patner, :id, :name, :created_at, :updated_at
json.url patner_url(patner, format: :json)
