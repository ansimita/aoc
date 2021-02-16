# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Ingredient
  attr_reader :capacity, :durability, :flavor, :texture, :calories

  def initialize(capacity, durability, flavor, texture, calories)
    @capacity = capacity
    @durability = durability
    @flavor = flavor
    @texture = texture
    @calories = calories
  end
end
