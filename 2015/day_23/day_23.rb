# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'computer'

if __FILE__ == $PROGRAM_NAME
  instructions = File.readlines('input.txt')

  c = Computer.new(a: 0, b: 0)
  c.run(instructions)
  puts "Part One: #{c.b}"

  c = Computer.new(a: 1, b: 0)
  c.run(instructions)
  puts "Part Two: #{c.b}"
end
