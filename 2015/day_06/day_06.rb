# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def brightness(instructions)
  grid = Array.new(1000) { Array.new(1000, 0) }
  instructions.each do |instruction|
    /(\d+),(\d+) through (\d+),(\d+)/.match(instruction) do |m|
      m[2].to_i.upto(m[4].to_i) do |j|
        m[1].to_i.upto(m[3].to_i) do |i|
          case instruction
          when /^turn on/  then grid[j][i] += 1
          when /^turn off/ then grid[j][i] -= 1 if grid[j][i].positive?
          when /^toggle/   then grid[j][i] += 2
          end
        end
      end
    end
  end
  grid.flatten.sum
end

def number_of_lights_lit(instructions)
  grid = Array.new(1000) { Array.new(1000, false) }
  instructions.each do |instruction|
    /(\d+),(\d+) through (\d+),(\d+)/.match(instruction) do |m|
      m[2].to_i.upto(m[4].to_i) do |j|
        m[1].to_i.upto(m[3].to_i) do |i|
          case instruction
          when /^turn on/  then grid[j][i] = true
          when /^turn off/ then grid[j][i] = false
          when /^toggle/   then grid[j][i] = !grid[j][i]
          end
        end
      end
    end
  end
  grid.flatten.count(true)
end

if __FILE__ == $PROGRAM_NAME
  instructions = File.readlines('input.txt')
  puts "Part One: #{number_of_lights_lit(instructions)}"
  puts "Part Two: #{brightness(instructions)}"
end
