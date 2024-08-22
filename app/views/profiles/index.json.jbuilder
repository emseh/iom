# frozen_string_literal: true

json.array! @leaders, partial: 'leaders/leader', as: :leader
