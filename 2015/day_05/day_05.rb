# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def number_of_nice_strings(strings, part)
  strings.count { |s| s.nice?(part) }
end

if __FILE__ == $PROGRAM_NAME
  strings = File.readlines('input.txt', chomp: true)
  puts "Part One: #{number_of_nice_strings(strings, :one)}"
  puts "Part Two: #{number_of_nice_strings(strings, :two)}"
end
