# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

def blocks_away(instructions, twice: false)
  x = 0
  y = 0
  history = Set.new << [x, y]
  direction = :north
  instructions.split(', ').each do |instruction|
    direction = case [instruction[0].to_sym, direction]
                when %i[L north], %i[R south] then :west
                when %i[L south], %i[R north] then :east
                when %i[L east], %i[R west] then :north
                when %i[L west], %i[R east] then :south
                end
    instruction[1..].to_i.times do
      case direction
      when :north then y += 1
      when :south then y -= 1
      when :east then x -= 1
      when :west then x += 1
      end
      return x.abs + y.abs if twice && history.include?([x, y])
      history << [x, y]
    end
  end
  x.abs + y.abs
end

if __FILE__ == $PROGRAM_NAME
  instructions = File.read('input.txt')
  puts "Part One: #{blocks_away(instructions)}"
  puts "Part Two: #{blocks_away(instructions, twice: true)}"
end
