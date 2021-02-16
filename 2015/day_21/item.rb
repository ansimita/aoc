# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Item
  attr_reader :name, :cost, :damage, :armor, :type

  def initialize(name, cost, damage, armor, type)
    @name = name
    @cost = cost
    @damage = damage
    @armor = armor
    @type = type
  end
end
