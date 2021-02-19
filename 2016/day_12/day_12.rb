# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'computer'

if __FILE__ == $PROGRAM_NAME
  assembunnies = File.readlines('input.txt')

  c = Computer.new(0)
  c.run(assembunnies)
  puts "Part One: #{c.a}"

  c = Computer.new(1)
  c.run(assembunnies)
  puts "Part Two: #{c.a}"
end
