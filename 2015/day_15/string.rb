# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'ingredient'

class String
  def to_ingredient
    properties = %w[capacity durability flavor texture calories].map do |s|
      match(Regexp.new("#{s} (-*\\d)")) { |m| m[1].to_i }
    end
    Ingredient.new(*properties)
  end
end
