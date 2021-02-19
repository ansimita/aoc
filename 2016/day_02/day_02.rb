# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'keypad'

def code(instructions, part)
  keypad = case part
           when :one then Keypad.new
           when :two then ActualKeypad.new
           end
  instructions.each do |line|
    line.each_char do |instruction|
      case instruction.to_sym
      when :U then keypad.move_up
      when :D then keypad.move_down
      when :L then keypad.move_left
      when :R then keypad.move_right
      end
    end
    keypad.press
  end
  keypad.code
end

if __FILE__ == $PROGRAM_NAME
  instructions = File.readlines('input.txt', chomp: true)
  puts "Part One: #{code(instructions, :one)}"
  puts "Part Two: #{code(instructions, :two)}"
end
