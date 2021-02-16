# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Character
  attr_accessor :hit, :damage, :armor

  def initialize(hit, damage, armor)
    @hit = hit
    @damage = damage
    @armor = armor
  end

  def attacked(attackers_damage)
    @hit -= attackers_damage > @armor ? attackers_damage - @armor : 1
  end

  def lost?
    @hit <= 0
  end
end
