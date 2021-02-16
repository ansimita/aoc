# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

def at_least_one_present(directions, with_robo_santa: false)
  history = if with_robo_santa
              santa_directions = String.new
              robot_directions = String.new
              directions.each_char.each_with_index do |char, index|
                (index.even? ? santa_directions : robot_directions) << char
              end
              visited(santa_directions) | visited(robot_directions)
            else
              visited(directions)
            end
  history.size
end

def visited(directions)
  x = 0
  y = 0
  history = Set.new << [x, y]
  directions.each_char do |direction|
    case direction
    when '^' then y += 1
    when 'v' then y -= 1
    when '<' then x -= 1
    when '>' then x += 1
    end
    history << [x, y]
  end
  history
end

if __FILE__ == $PROGRAM_NAME
  directions = File.read('input.txt')
  puts "Part One: #{at_least_one_present(directions)}"
  puts "Part Two: #{at_least_one_present(directions, with_robo_santa: true)}"
end
