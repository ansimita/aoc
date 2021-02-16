# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'character'
require_relative 'item'

# rubocop:disable Layout/ExtraSpacing

W0 = Item.new('Dagger',       8, 4, 0, :weapon)
W1 = Item.new('Shortsword',  10, 5, 0, :weapon)
W2 = Item.new('Warhammer',   25, 6, 0, :weapon)
W3 = Item.new('Longsword',   40, 7, 0, :weapon)
W4 = Item.new('Greataxe',    74, 8, 0, :weapon)
WX = [W0, W1, W2, W3, W4].freeze

A0 = Item.new('Leather',     13, 0, 1, :armor)
A1 = Item.new('Chainmail',   31, 0, 2, :armor)
A2 = Item.new('Splitmail',   53, 0, 3, :armor)
A3 = Item.new('Bandedmail',  75, 0, 4, :armor)
A4 = Item.new('Platemail',  102, 0, 5, :armor)
AX = [A0, A1, A2, A3, A4].freeze

R0 = Item.new('Damage +1',   25, 1, 0, :ring)
R1 = Item.new('Damage +2',   50, 2, 0, :ring)
R2 = Item.new('Damage +3',  100, 3, 0, :ring)
R3 = Item.new('Defense +1',  20, 0, 1, :ring)
R4 = Item.new('Defense +2',  40, 0, 2, :ring)
R5 = Item.new('Defense +3',  80, 0, 3, :ring)
RX = [R0, R1, R2, R3, R4, R5].freeze

# rubocop:enable Layout/ExtraSpacing

# rubocop:disable Style/CombinableLoops

def configurations
  # 1 weapon + 0 armor + 0 ring
  WX.each { |w| yield w.cost, w.damage, w.armor }
  # 1 weapon + 1 armor + 0 ring
  WX.each { |w| AX.each { |a| yield w.cost + a.cost, w.damage, a.armor } }
  # 1 weapon + 1 armor + 1 ring
  WX.each do |w|
    AX.each do |a|
      RX.each do |r|
        yield w.cost + a.cost + r.cost, w.damage + r.damage, a.armor + r.armor
      end
    end
  end
  # 1 weapon + 1 armor + 2 rings
  WX.each do |w|
    AX.each do |a|
      RX.combination(2) do |r|
        yield w.cost + a.cost + r.first.cost + r.last.cost,
          w.damage + r.first.damage + r.last.damage,
          a.armor + r.first.armor + r.last.armor
      end
    end
  end
  # 1 weapon + 0 armor + 1 ring
  WX.each do |w|
    RX.each { |r| yield w.cost + r.cost, w.damage + r.damage, r.armor }
  end
  # 1 weapon + 0 armor + 2 rings
  WX.each do |w|
    RX.combination(2) do |r|
      yield w.cost + r.first.cost + r.last.cost,
        w.damage + r.first.damage + r.last.damage,
        r.first.armor + r.last.armor
    end
  end
end

# rubocop:enable Style/CombinableLoops

def lose_spending_most(boss_hit, boss_damage, boss_armor)
  gold = []
  configurations do |cost, damage, armor|
    boss = Character.new(boss_hit, boss_damage, boss_armor)
    plyr = Character.new(100, damage, armor)
    gold << cost unless player_defeats_boss?(plyr, boss)
  end
  gold.max
end

def player_defeats_boss?(player, boss)
  loop do
    boss.attacked(player.damage)
    break true if boss.lost?
    player.attacked(boss.damage)
    break false if player.lost?
  end
end

def win_spending_least(boss_hit, boss_damage, boss_armor)
  gold = []
  configurations do |cost, damage, armor|
    boss = Character.new(boss_hit, boss_damage, boss_armor)
    plyr = Character.new(100, damage, armor)
    gold << cost if player_defeats_boss?(plyr, boss)
  end
  gold.min
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines('input.txt', chomp: true)
  hit = lines[0].split.last.to_i
  damage = lines[1].split.last.to_i
  armor = lines[2].split.last.to_i

  puts "Part One: #{win_spending_least(hit, damage, armor)}"
  puts "Part Two: #{lose_spending_most(hit, damage, armor)}"
end
