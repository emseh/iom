# frozen_string_literal: true

json.extract! leader, :id, :created_at, :updated_at
json.url leader_url(leader, format: :json)
