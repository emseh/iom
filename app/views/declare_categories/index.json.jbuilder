# frozen_string_literal: true

json.array! @declare_categories, partial: 'declare_categories/declare_category', as: :declare_category
