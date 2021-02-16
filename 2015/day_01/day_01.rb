# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def basement_instruction_position(instructions)
  current_floor = 0
  instructions.each_char.each_with_index do |char, index|
    case char
    when '(' then current_floor += 1
    when ')' then current_floor -= 1
    end
    return index + 1 if current_floor == -1
  end
end

def which_floor(instructions)
  instructions.each_char.tally.values.reduce(:-)
end

if __FILE__ == $PROGRAM_NAME
  instructions = File.read('input.txt')
  puts "Part One: #{which_floor(instructions)}"
  puts "Part Two: #{basement_instruction_position(instructions)}"
end
